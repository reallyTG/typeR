library(storr)


### Name: test_driver
### Title: Test a storr driver
### Aliases: test_driver

### ** Examples

## Testing the environment driver is nice and fast:
if (requireNamespace("testthat")) {
  create_env <- function(dr = NULL, ...) {
    driver_environment(dr$envir, ...)
  }
  test_driver(create_env)
}

# To test things like the rds driver, I would run:
## Not run: 
##D if (requireNamespace("testthat")) {
##D   create_rds <- function(dr = NULL) {
##D     driver_rds(if (is.null(dr)) tempfile() else dr$path)
##D   }
##D   test_driver(create_rds)
##D }
## End(Not run)



