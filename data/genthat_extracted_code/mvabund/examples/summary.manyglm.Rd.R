library(mvabund)


### Name: summary.manyglm
### Title: Summarizing Multivariate Generalized Linear Model Fits for
###   Abundance Data
### Aliases: summary.manyglm print.summary.manyglm
### Keywords: models regression multivariate

### ** Examples

data(spider)
spiddat <- mvabund(spider$abund)
X <- spider$x

## Estimate the coefficients of a multivariate glm
glm.spid <- manyglm(spiddat[,1:3]~X, family="negative.binomial")

## Estimate the statistical significance of different multivariate terms in 
## the model, using the default settings of LR test, and 100 PIT-trap resamples
summary(glm.spid, show.time=TRUE) 

## Repeat with the parametric bootstrap and wald statistics 
summary(glm.spid, resamp="monte.carlo", test="wald", nBoot=300) 




