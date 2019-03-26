library(episensr)


### Name: probsens.irr.conf
### Title: Probabilistic sensitivity analysis for unmeasured confounding of
###   person-time data and random error.
### Aliases: probsens.irr.conf

### ** Examples

set.seed(123)
# Unmeasured confounding
probsens.irr.conf(matrix(c(77, 10000, 87, 10000),
dimnames = list(c("D+", "Person-time"), c("E+", "E-")), ncol = 2),
reps = 20000,
prev.exp = list("trapezoidal", c(.01, .2, .3, .51)),
prev.nexp = list("trapezoidal", c(.09, .27, .35, .59)),
risk = list("trapezoidal", c(2, 2.5, 3.5, 4.5)),
corr.p = .8)



