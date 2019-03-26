library(geoR)


### Name: boxcox
### Title: The Box-Cox Transformed Normal Distribution
### Aliases: rboxcox dboxcox
### Keywords: distribution

### ** Examples

## Simulating data
simul <- rboxcox(100, lambda=0.5, mean=10, sd=2)
##
## Comparing models with different lambdas,
## zero  means and unit variances
curve(dboxcox(x, lambda=-1), 0, 8)
for(lambda in seq(-.5, 1.5, by=0.5))
  curve(dboxcox(x, lambda), 0, 8, add = TRUE)



