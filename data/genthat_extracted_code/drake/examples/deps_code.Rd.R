library(drake)


### Name: deps_code
### Title: List the dependencies of a function, workflow plan command, or
###   knitr report source file.
### Aliases: deps_code

### ** Examples

# Your workflow likely depends on functions in your workspace.
f <- function(x, y) {
  out <- x + y + g(x)
  saveRDS(out, "out.rds")
}
# Find the dependencies of f. These could be R objects/functions
# in your workspace or packages. Any file names or target names
# will be ignored.
deps_code(f)
# Define a workflow plan data frame that uses your function f().
my_plan <- drake_plan(
  x = 1 + some_object,
  my_target = x + readRDS(file_in("tracked_input_file.rds")),
  return_value = f(x, y, g(z + w)),
  strings_in_dots = "literals"
)
# Get the dependencies of workflow plan commands.
# Here, the dependencies could be R functions/objects from your workspace
# or packages, imported files, or other targets in the workflow plan.
deps_code(my_plan$command[1])
deps_code(my_plan$command[2])
deps_code(my_plan$command[3])
# New: you can also supply language objects.
deps_code(expression(x + 123))
## Not run: 
##D test_with_dir("Quarantine side effects.", {
##D load_mtcars_example() # Get the code with drake_example("mtcars").
##D # Dependencies of the knitr-generated targets like 'report.md'
##D # include targets/imports referenced with `readd()` or `loadd()`.
##D deps_code(file_store("report.Rmd"))
##D })
## End(Not run)



