library(cepp)


### Name: evaluator
### Title: Function to evaluate spatial quantiles
### Aliases: evaluator

### ** Examples

x <- rnorm(500)
dim(x) <- c(250,2)
ev <- evaluator(250,2)
##The Spatial Median
trust(ev, parinit=c(median(x[1,]), median(x[2,])), u=c(0,0),
      rinit=0.5, rmax=2e5, samp = x)
##Quantile for vector (0.2,0.3)
trust(ev, parinit=c(median(x[1,]), median(x[2,])), u=c(0.2,0.3),
      rinit=0.5, rmax=2e5, samp = x)



