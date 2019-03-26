library(phenocamr)


### Name: optimal_span
### Title: Calculates the optimal span for a loess spline
### Aliases: optimal_span
### Keywords: loess, series smoother, span, time

### ** Examples


## No test: 
# Internal function only, should not be used stand-alone.
l <- sin(seq(1,10,0.01))
l <- l + runif(length(l))
optimal_span(l, plot = TRUE)
## End(No test)



