library(PointFore)


### Name: quantiles
### Title: Identification function for state-dependent quantiles
### Aliases: quantiles

### ** Examples

### estimate expectation of identification function for quantile forecasts

set.seed(1)
y <- rnorm(1000)
x <- qnorm(0.6)
# expectation of identification with quantile level 0.6 is zero
mean(quantiles(x,y,0,0.6,constant))
# expectation of identification function with different quantile level
# (0.5 is the median) is not zero
mean(quantiles(x,y,0,0.5, constant))



