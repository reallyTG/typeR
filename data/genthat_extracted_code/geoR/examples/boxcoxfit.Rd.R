library(geoR)


### Name: boxcoxfit
### Title: Parameter Estimation for the Box-Cox Transformation
### Aliases: boxcoxfit print.boxcoxfit plot.boxcoxfit lines.boxcoxfit
###   .negloglik.boxcox
### Keywords: regression models hplot

### ** Examples

set.seed(384)
## Simulating data
simul <- rboxcox(100, lambda=0.5, mean=10, sd=2)
## Finding the ML estimates
ml <- boxcoxfit(simul)
ml
## Ploting histogram and fitted model
plot(ml)
##
## Comparing models with different lambdas,
## zero  means and unit variances
curve(dboxcox(x, lambda=-1), 0, 8)
for(lambda in seq(-.5, 1.5, by=0.5))
  curve(dboxcox(x, lambda), 0, 8, add = TRUE)
##
## Another example, now estimating lambda2
##
simul <- rboxcox(100, lambda=0.5, mean=10, sd=2)
ml <- boxcoxfit(simul, lambda2 = TRUE)
ml
plot(ml)
##
## An example with a regression model
##
boxcoxfit(object = trees[,3], xmat = trees[,1:2])



