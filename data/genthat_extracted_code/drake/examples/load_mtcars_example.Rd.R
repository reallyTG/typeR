library(drake)


### Name: load_mtcars_example
### Title: Load the mtcars example.
### Aliases: load_mtcars_example

### ** Examples

## Not run: 
##D test_with_dir("Quarantine side effects.", {
##D # Populate your workspace and write 'report.Rmd'.
##D load_mtcars_example() # Get the code: drake_example("mtcars")
##D # Check the dependencies of an imported function.
##D deps_code(reg1)
##D # Check the dependencies of commands in the workflow plan.
##D deps_code(my_plan$command[1])
##D deps_code(my_plan$command[4])
##D # Plot the interactive network visualization of the workflow.
##D config <- drake_config(my_plan)
##D outdated(config) # Which targets are out of date?
##D # Run the workflow to build all the targets in the plan.
##D make(my_plan)
##D outdated(config) # Everything should be up to date.
##D # For the reg2() model on the small dataset,
##D # the p-value is so small that there may be an association
##D # between weight and fuel efficiency after all.
##D readd(coef_regression2_small)
##D # Clean up the example.
##D clean_mtcars_example()
##D })
## End(Not run)



