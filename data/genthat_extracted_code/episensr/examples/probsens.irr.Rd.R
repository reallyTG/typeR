library(episensr)


### Name: probsens.irr
### Title: Probabilistic sensitivity analysis for exposure
###   misclassification of person-time data and random error.
### Aliases: probsens.irr

### ** Examples

set.seed(123)
# Exposure misclassification, non-differential
probsens.irr(matrix(c(2, 67232, 58, 10539000),
dimnames = list(c("GBS+", "Person-time"), c("HPV+", "HPV-")), ncol = 2),
reps = 20000,
seca.parms = list("trapezoidal", c(.4, .45, .55, .6)),
spca.parms = list("constant", 1))



