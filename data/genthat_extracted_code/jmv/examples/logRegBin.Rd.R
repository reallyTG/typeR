library(jmv)


### Name: logRegBin
### Title: Binomial Logistic Regression
### Aliases: logRegBin

### ** Examples

data('birthwt', package='MASS')

dat <- data.frame(
            low = factor(birthwt$low),
            age = birthwt$age,
            bwt = birthwt$bwt)

logRegBin(data = dat, dep = low,
          covs = vars(age, bwt),
          blocks = list(list("age", "bwt")),
          refLevels = list(list(var="low", ref="0")))

#
#  BINOMIAL LOGISTIC REGRESSION
#
#  Model Fit Measures
#  ---------------------------------------
#    Model    Deviance    AIC     R²-McF
#  ---------------------------------------
#        1     4.97e-7    6.00     1.000
#  ---------------------------------------
#
#
#  MODEL SPECIFIC RESULTS
#
#  MODEL 1
#
#  Model Coefficients
#  ------------------------------------------------------------
#    Predictor    Estimate      SE          Z           p
#  ------------------------------------------------------------
#    Intercept    2974.73225    218237.2      0.0136    0.989
#    age            -0.00653       482.7    -1.35e-5    1.000
#    bwt            -1.18532        87.0     -0.0136    0.989
#  ------------------------------------------------------------
#    Note. Estimates represent the log odds of "low = 1"
#    vs. "low = 0"
#
#




