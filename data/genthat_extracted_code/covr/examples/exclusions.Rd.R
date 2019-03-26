library(covr)


### Name: exclusions
### Title: Exclusions
### Aliases: exclusions

### ** Examples

## Not run: 
##D # exclude whole file of R/test.R
##D package_coverage(exclusions = "R/test.R")
##D 
##D # exclude lines 1 to 10 and 15 from R/test.R
##D package_coverage(line_exclusions = list("R/test.R" = c(1:10, 15)))
##D 
##D # exclude lines 1 to 10 from R/test.R, all of R/test2.R
##D package_coverage(line_exclusions = list("R/test.R" = 1:10, "R/test2.R"))
##D 
##D # exclude all print and format methods from the package.
##D package_coverage(function_exclusions = c("print\\.", "format\\."))
##D 
##D # single line exclusions
##D f1 <- function(x) {
##D   x + 1 # nocov
##D }
##D 
##D # ranged exclusions
##D f2 <- function(x) { # nocov start
##D   x + 2
##D } # nocov end
## End(Not run)



