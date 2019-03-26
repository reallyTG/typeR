library(episensr)


### Name: probsens
### Title: Probabilistic sensitivity analysis.
### Aliases: probsens

### ** Examples

# The data for this example come from:
# Greenland S., Salvan A., Wegman D.H., Hallock M.F., Smith T.J.
# A case-control study of cancer mortality at a transformer-assembly facility.
# Int Arch Occup Environ Health 1994; 66(1):49-54.
set.seed(123)
# Exposure misclassification, non-differential
probsens(matrix(c(45, 94, 257, 945),
dimnames = list(c("BC+", "BC-"), c("Smoke+", "Smoke-")), nrow = 2, byrow = TRUE),
type = "exposure",
reps = 20000,
seca.parms = list("trapezoidal", c(.75, .85, .95, 1)),
spca.parms = list("trapezoidal", c(.75, .85, .95, 1)))
# Exposure misclassification, differential
probsens(matrix(c(45, 94, 257, 945),
dimnames = list(c("BC+", "BC-"), c("Smoke+", "Smoke-")), nrow = 2, byrow = TRUE),
type = "exposure",
reps = 20000,
seca.parms = list("trapezoidal", c(.75, .85, .95, 1)),
seexp.parms = list("trapezoidal", c(.7, .8, .9, .95)),
spca.parms = list("trapezoidal", c(.75, .85, .95, 1)),
spexp.parms = list("trapezoidal", c(.7, .8, .9, .95)),
corr.se = .8,
corr.sp = .8)
# Disease misclassification
probsens(matrix(c(173, 602, 134, 663),
dimnames = list(c("BC+", "BC-"), c("Smoke+", "Smoke-")), nrow = 2, byrow = TRUE),
type = "outcome",
reps = 20000,
seca.parms = list("uniform", c(.8, 1)),
spca.parms = list("uniform", c(.8, 1)))



