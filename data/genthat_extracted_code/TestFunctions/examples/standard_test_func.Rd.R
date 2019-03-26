library(TestFunctions)


### Name: standard_test_func
### Title: Create a standard test function.
### Aliases: standard_test_func

### ** Examples

.gaussian1 <- function(x, center=.5, s2=.01) {
  exp(-sum((x-center)^2/2/s2))
}
gaussian1 <- standard_test_func(.gaussian1, scale_it=FALSE, scale_low = c(0,0), scale_high = c(1,1))
curve(gaussian1(matrix(x,ncol=1)))



