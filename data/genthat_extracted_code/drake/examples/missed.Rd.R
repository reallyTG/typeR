library(drake)


### Name: missed
### Title: Report any import objects required by your drake_plan plan but
###   missing from your workspace.
### Aliases: missed

### ** Examples

## Not run: 
##D test_with_dir("Quarantine side effects.", {
##D load_mtcars_example() # Get the code with drake_example("mtcars").
##D config <- drake_config(my_plan)
##D missed(config) # All the imported files and objects should be present.
##D rm(reg1) # Remove an import dependency from you workspace.
##D missed(config) # Should report that reg1 is missing.
##D })
## End(Not run)



