Feature: generating rails3 engine directories and files
  In order to use rails 3 engines with jeweler generators
  A user should be able to
  generate a project setup and specify the rails3_engine option

  Scenario: sans rails3 engine setup
    Given a working directory
    And I have configured git sanely
    And I do not want to create a rails3 engine
    When I generate a project named 'the-perfect-gem' that is 'zomg, so good'
    Then a directory named 'the-perfect-gem/app' is not created
    And a directory named 'the-perfect-gem/app/controllers' is not created
    And a directory named 'the-perfect-gem/app/helpers' is not created
    And a directory named 'the-perfect-gem/app/models' is not created
    And a directory named 'the-perfect-gem/app/views' is not created
    And a directory named 'the-perfect-gem/lib/the-perfect-gem' is not created
    And a file named 'the-perfect-gem/lib/the-perfect-gem/engine.rb' is not created
    And a directory named 'the-perfect-gem/lib/generators' is not created
    And a directory named 'the-perfect-gem/lib/the-perfect-gem/railties' is not created
    And a file named 'the-perfect-gem/lib/the-perfect-gem/railties/tasks.rake' is not created
    And 'lib/the-perfect-gem.rb' is blank

  Scenario: Rails 3 engine setup
    Given a working directory
    And I have configured git sanely
    And I want to create a rails3 engine
    When I generate a project named 'the-perfect-gem' that is 'zomg, so good'
    Then a directory named 'the-perfect-gem/app' is created
    And a directory named 'the-perfect-gem/app/controllers' is created
    And a directory named 'the-perfect-gem/app/helpers' is created
    And a directory named 'the-perfect-gem/app/models' is created
    And a directory named 'the-perfect-gem/app/views' is created
    And a directory named 'the-perfect-gem/lib/the-perfect-gem' is created

    And a directory named 'the-perfect-gem/lib/generators' is created
    And a directory named 'the-perfect-gem/lib/the-perfect-gem/railties' is created
    And a file named 'the-perfect-gem/lib/the-perfect-gem/railties/tasks.rake' is created
    And 'lib/the-perfect-gem/railties/tasks.rake' is blank

    And a file named 'the-perfect-gem/lib/the-perfect-gem/engine.rb' is created
    And 'lib/the-perfect-gem/engine.rb' requires 'the-perfect-gem'
    And 'lib/the-perfect-gem/engine.rb' requires 'rails'
    And 'lib/the-perfect-gem/engine.rb' has a module based on the class name
    And 'lib/the-perfect-gem/engine.rb' subclasses rails engine
    And 'lib/the-perfect-gem/engine.rb' has placeholders for initializers and rake task inclusion

    And a file named 'the-perfect-gem/lib/the-perfect-gem.rb' is created
    And 'lib/the-perfect-gem.rb' requires the engine