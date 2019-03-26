library(jmv)


### Name: logRegMulti
### Title: Multinomial Logistic Regression
### Aliases: logRegMulti

### ** Examples

data('birthwt', package='MASS')

dat <- data.frame(
            race = factor(birthwt$race),
            age = birthwt$age,
            low = factor(birthwt$low))

logRegMulti(data = dat, dep = race,
            covs = age, factors = low,
            blocks = list(list("age", "low")),
            refLevels = list(
                list(var="race", ref="1"),
                list(var="low", ref="0")))

#
#  MULTINOMIAL LOGISTIC REGRESSION
#
#  Model Fit Measures
#  --------------------------------------
#    Model    Deviance    AIC    R²-McF
#  --------------------------------------
#        1         360    372    0.0333
#  --------------------------------------
#
#
#  MODEL SPECIFIC RESULTS
#
#  MODEL 1
#
#  Model Coefficients
#  ---------------------------------------------------------------
#    race     Predictor    Estimate    SE        Z         p
#  ---------------------------------------------------------------
#    2 - 1    Intercept      0.8155    1.1186     0.729    0.466
#             age           -0.1038    0.0487    -2.131    0.033
#             low:
#             1 – 0          0.7527    0.4700     1.601    0.109
#    3 - 1    Intercept      1.0123    0.7798     1.298    0.194
#             age           -0.0663    0.0324    -2.047    0.041
#             low:
#             1 – 0          0.5677    0.3522     1.612    0.107
#  ---------------------------------------------------------------
#
#




