library(mvabund)


### Name: coefplot.manyglm
### Title: Plots the coefficients of the covariates of a manyglm object
###   with confidence intervals.
### Aliases: coefplot.manyglm coefplot
### Keywords: models regression multivariate hplot

### ** Examples

## Load the hunting spider data set
data(spider)
spiddat <- mvabund(spider$abund)
X <- spider$x
#To fit a log-linear model assuming counts are negative binomial:
glm.spid <- manyglm(spiddat~X, family="negative.binomial")
# A coefplot of soil.dry and bare.sand parameters:
coefplot.manyglm(glm.spid, which.Xcoef=2:3) # note which.Xcoef=1 is the intercept



