library(keras)


### Name: is_keras_available
### Title: Check if Keras is Available
### Aliases: is_keras_available

### ** Examples

## Not run: 
##D # testthat utilty for skipping tests when Keras isn't available
##D skip_if_no_keras <- function(version = NULL) {
##D   if (!is_keras_available(version))
##D     skip("Required keras version not available for testing")
##D }
##D 
##D # use the function within a test
##D test_that("keras function works correctly", {
##D   skip_if_no_keras()
##D   # test code here
##D })
## End(Not run)




