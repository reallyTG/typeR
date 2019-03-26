library(MKLE)


### Name: mkle.ci
### Title: Confidence intervals for the maximum kernel likelihood estimator
### Aliases: mkle.ci
### Keywords: htest nonparametric

### ** Examples

data(state)
mkle.ci(state$CRIME,method=c('wald','percentile'),B=100,gridsize=2^11)



