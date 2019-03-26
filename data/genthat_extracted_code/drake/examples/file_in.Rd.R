library(drake)


### Name: file_in
### Title: Declare the file inputs of a workflow plan command.
### Aliases: file_in

### ** Examples

## Not run: 
##D test_with_dir("Contain side effects", {
##D # The `file_out()` and `file_in()` functions
##D # just takes in strings and returns them.
##D file_out("summaries.txt")
##D # Their main purpose is to orchestrate your custom files
##D # in your workflow plan data frame.
##D suppressWarnings(
##D   plan <- drake_plan(
##D     write.csv(mtcars, file_out("mtcars.csv")),
##D     contents = read.csv(file_in("mtcars.csv")),
##D     strings_in_dots = "literals" # deprecated but useful: no single quotes needed. # nolint
##D   )
##D )
##D plan
##D # drake knows "\"mtcars.csv\"" is the first target
##D # and a dependency of `contents`. See for yourself:
##D make(plan)
##D file.exists("mtcars.csv")
##D # See also `knitr_in()`. `knitr_in()` is like `file_in()`
##D # except that it analyzes active code chunks in your `knitr`
##D # source file and detects non-file dependencies.
##D # That way, updates to the right dependencies trigger rebuilds
##D # in your report.
##D })
## End(Not run)



