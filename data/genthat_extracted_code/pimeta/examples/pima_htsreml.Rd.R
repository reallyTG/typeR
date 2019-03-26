library(pimeta)


### Name: pima_htsreml
### Title: Partlett-Riley prediction interval
### Aliases: pima_htsreml htsreml

### ** Examples

data(sbp, package = "pimeta")
pimeta::pima_htsreml(sbp$y, sbp$sigmak)
# 
# Prediction Interval for Random-Effects Meta-Analysis
# 
# Partlett-Riley prediction interval
#  Heterogeneity variance: REML
#  SE for average treatment effect: Hartung-Knapp
# 
# Average treatment effect [95%PI]:
#  -0.3287 [-0.9887, 0.3312]
# 
# Average treatment effect [95%CI]:
#  -0.3287 [-0.5761, -0.0814]
# 
# Heterogeneity variance (tau^2):
#  0.0700
#



