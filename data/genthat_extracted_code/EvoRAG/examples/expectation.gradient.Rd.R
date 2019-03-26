library(EvoRAG)


### Name: expectation.gradient
### Title: calculate the expected (i.e. mean) Euclidean distances for a
###   gradient model
### Aliases: expectation.gradient
### Keywords: Expectation

### ** Examples

## Not run: 
##D ##Example 1
##D   ###Expectation after 3 time units under BM_linear with Beta at 0 = 7, and 
##D   ###a slope of Beta = -0.1.
##D   expectation.gradient(gradient.span = c(0, 60), model = c("BM_linear"), 
##D      values = FALSE, parameters=c(7,-0.1), time=c(3),quantile=TRUE)
##D 
##D 
##D ##Example 2
##D   ###Expectation after 3 time units under OU_linear with Beta constant 
##D   ###across the gradient and alpha declining.
##D   expectation.gradient(gradient.span = c(0, 60), model = c("OU_linear"), 
##D      values = FALSE, parameters=c(0.1, 0, 7, -0.1), time=c(3),quantile=TRUE)
##D 
##D 
##D ##Example 3
##D   ###Expectation after 3 time units under OU_linear with Beta declining across 
##D   ###the gradient and alpha remaining constant.
##D   expectation.gradient(gradient.span = c(0, 60), model = c("OU_linear"), 
##D      values = FALSE, parameters=c(7, -0.1, 10, 0), time=c(3),quantile=TRUE)
##D 
##D 
##D ##Example 4
##D   ###Expectation after 3 time units under BM_2rate with Beta 5 times higher 
##D   ###after a breakpoint at L = 20.
##D   expectation.gradient(gradient.span = c(0, 60), model = c("BM_2rate"), 
##D      values = FALSE, parameters=c(1, 20,5), time=c(3),quantile=FALSE)
##D 
##D ##Example 5
##D   ###Expectation after 3 time units under BM_linear_breakpoint with the slope
##D   ###of Beta increasing 5 times higher after a breakpoint at L = 20.
##D   expectation.gradient(gradient.span = c(0, 60), model = c("BM_linear_breakpoint"), 
##D      values = FALSE, parameters=c(0.1, 0.001, 20,0.1), time=c(3),quantile=TRUE)
##D 
##D 
##D ##Example 6
##D   ###Expectation after 3 time units under BM_quadratic in which beta increases 
##D   ###initially across the gradient and then declines. Under the quadratic, 
##D   ###Beta_a (the third parameter) > 0 parabola curves upward, Beta_a < 0 downward.
##D   expectation.gradient(gradient.span = c(0, 60), model = c("BM_quadratic"), 
##D      values = FALSE, parameters=c(10, 15, -0.2), time=c(3),quantile=TRUE)
## End(Not run)



