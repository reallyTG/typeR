library(jmv)


### Name: logLinear
### Title: Log-Linear Regression
### Aliases: logLinear

### ** Examples

data('mtcars')

tab <- table('gear'=mtcars$gear, 'cyl'=mtcars$cyl)
dat <- as.data.frame(tab)

logLinear(data = dat, factors = vars(gear, cyl),  counts = Freq,
          blocks = list(list("gear", "cyl", c("gear", "cyl"))),
          refLevels = list(
              list(var="gear", ref="3"),
              list(var="cyl", ref="4")))

#
#  LOG-LINEAR REGRESSION
#
#  Model Fit Measures
#  ---------------------------------------
#    Model    Deviance    AIC     R²-McF
#  ---------------------------------------
#        1    4.12e-10    41.4     1.000
#  ---------------------------------------
#
#
#  MODEL SPECIFIC RESULTS
#
#  MODEL 1
#
#  Model Coefficients
#  ------------------------------------------------------------------
#    Predictor          Estimate     SE          Z            p
#  ------------------------------------------------------------------
#    Intercept          -4.71e-16        1.00    -4.71e-16    1.000
#    gear:
#    4 – 3                  2.079        1.06        1.961    0.050
#    5 – 3                  0.693        1.22        0.566    0.571
#    cyl:
#    6 – 4                  0.693        1.22        0.566    0.571
#    8 – 4                  2.485        1.04        2.387    0.017
#    gear:cyl:
#    (4 – 3):(6 – 4)       -1.386        1.37       -1.012    0.311
#    (5 – 3):(6 – 4)       -1.386        1.73       -0.800    0.423
#    (4 – 3):(8 – 4)      -26.867    42247.17    -6.36e -4    0.999
#    (5 – 3):(8 – 4)       -2.485        1.44       -1.722    0.085
#  ------------------------------------------------------------------
#
#




