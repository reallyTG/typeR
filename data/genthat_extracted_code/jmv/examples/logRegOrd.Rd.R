library(jmv)


### Name: logRegOrd
### Title: Ordinal Logistic Regression
### Aliases: logRegOrd

### ** Examples

set.seed(1337)

y <- factor(sample(1:3, 100, replace = TRUE))
x1 <- rnorm(100)
x2 <- rnorm(100)

df <- data.frame(y=y, x1=x1, x2=x2)

logRegOrd(data = df, dep = y,
          covs = vars(x1, x2),
          blocks = list(list("x1", "x2")))

#
#  ORDINAL LOGISTIC REGRESSION
#
#  Model Fit Measures
#  ---------------------------------------
#    Model    Deviance    AIC    R²-McF
#  ---------------------------------------
#        1         218    226    5.68e-4
#  ---------------------------------------
#
#
#  MODEL SPECIFIC RESULTS
#
#  MODEL 1
#
#  Model Coefficients
#  ----------------------------------------------------
#    Predictor    Estimate    SE       Z        p
#  ----------------------------------------------------
#    x1             0.0579    0.193    0.300    0.764
#    x2             0.0330    0.172    0.192    0.848
#  ----------------------------------------------------
#
#




