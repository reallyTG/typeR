library(drake)


### Name: knitr_deps
### Title: Find the drake dependencies of a dynamic knitr report target.
### Aliases: knitr_deps

### ** Examples

## Not run: 
##D test_with_dir("Quarantine side effects.", {
##D load_mtcars_example() # Get the code with drake_example("mtcars").
##D knitr_deps("'report.Rmd'") # Files must be single-quoted.
##D # Find the dependencies of the compiled output target, 'report.md'.
##D knitr_deps("report.Rmd")
##D make(my_plan) # Run the project.
##D # Work only on the Rmd source, not the output.
##D try(knitr_deps("'report.md'"), silent = FALSE) # error
##D })
## End(Not run)



