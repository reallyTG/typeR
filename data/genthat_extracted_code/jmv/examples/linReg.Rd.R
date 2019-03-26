library(jmv)


### Name: linReg
### Title: Linear Regression
### Aliases: linReg

### ** Examples

data('Prestige', package='carData')

linReg(data = Prestige, dep = income,
       covs = vars(education, prestige, women),
       blocks = list(list('education', 'prestige', 'women')))

#
#  LINEAR REGRESSION
#
#  Model Fit Measures
#  ---------------------------
#    Model    R        R²
#  ---------------------------
#        1    0.802    0.643
#  ---------------------------
#
#
#  MODEL SPECIFIC RESULTS
#
#  MODEL 1
#
#
#  Model Coefficients
#  --------------------------------------------------------
#    Predictor    Estimate    SE         t         p
#  --------------------------------------------------------
#    Intercept      -253.8    1086.16    -0.234     0.816
#    women           -50.9       8.56    -5.948    < .001
#    prestige        141.4      29.91     4.729    < .001
#    education       177.2     187.63     0.944     0.347
#  --------------------------------------------------------
#




