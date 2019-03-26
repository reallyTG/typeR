library(drake)


### Name: check_plan
### Title: Check a workflow plan data frame for obvious errors.
### Aliases: check_plan

### ** Examples

## Not run: 
##D test_with_dir("Quarantine side effects.", {
##D load_mtcars_example() # Get the code with drake_example("mtcars").
##D check_plan(my_plan) # Check the workflow plan dataframe for obvious errors.
##D unlink("report.Rmd") # Remove an import file mentioned in the plan.
##D # If you un-suppress the warnings, check_plan()
##D # will tell you that 'report.Rmd' is missing.
##D suppressWarnings(check_plan(my_plan))
##D })
## End(Not run)



