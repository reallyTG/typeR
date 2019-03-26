library(drake)


### Name: knitr_in
### Title: Declare the 'knitr'/'rmarkdown' source files of a workflow plan
###   command.
### Aliases: knitr_in

### ** Examples

## Not run: 
##D test_with_dir("Contain side effects", {
##D # `knitr_in()` is like `file_in()`
##D # except that it analyzes active code chunks in your `knitr`
##D # source file and detects non-file dependencies.
##D # That way, updates to the right dependencies trigger rebuilds
##D # in your report.
##D # The mtcars example (`drake_example("mtcars")`)
##D # already has a demonstration
##D load_mtcars_example()
##D make(my_plan)
##D # Now how did drake magically know that
##D # `small`, `large`, and `coef_regression2_small` were
##D # dependencies of the output file `report.md`?
##D # because the command in the workflow plan had
##D # `knitr_in("report.Rmd")` in it, so drake knew
##D # to analyze the active code chunks. There, it spotted
##D # where `small`, `large`, and `coef_regression2_small`
##D # were read from the cache using calls to `loadd()` and `readd()`.
##D })
## End(Not run)



