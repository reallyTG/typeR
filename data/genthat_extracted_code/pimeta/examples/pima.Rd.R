library(pimeta)


### Name: pima
### Title: Calculating Prediction Intervals
### Aliases: pima

### ** Examples

data(sbp, package = "pimeta")
set.seed(20161102)
## No test: 
pimeta::pima(sbp$y, sbp$sigmak, B = 50000)
## End(No test)
# 
# Prediction Interval for Random-Effects Meta-Analysis
# 
# A parametric bootstrap prediction interval
#  Heterogeneity variance: DerSimonian-Laird
#  SE for average treatment effect: Hartung
# 
# Average treatment effect [95%PI]:
#  -0.3341 [-0.8769, 0.2248]
# 
# Average treatment effect [95%CI]:
#  -0.3341 [-0.5660, -0.0976]
# 
# Heterogeneity variance (tau^2):
#  0.0282
 
## No test: 
pimeta::pima(sbp$y, sbp$sigmak, method = "HTS")
## End(No test)
# 
# Prediction Interval for Random-Effects Meta-Analysis
# 
# Higgins-Thompson-Spiegelhalter prediction interval
#  Heterogeneity variance: DerSimonian-Laird
#  SE for average treatment effect: standard
# 
# Average treatment effect [95%PI]:
#  -0.3341 [-0.7598, 0.0917]
# 
# Average treatment effect [95%CI]:
#  -0.3341 [-0.5068, -0.1613]
# 
# Heterogeneity variance (tau^2):
#  0.0282

## No test: 
pimeta::pima(sbp$y, sbp$sigmak, method = "HK")
## End(No test)
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

## No test: 
pimeta::pima(sbp$y, sbp$sigmak, method = "SJ")
## End(No test)
# 
# Prediction Interval for Random-Effects Meta-Analysis
# 
# Partlett-Riley prediction interval
#  Heterogeneity variance: REML
#  SE for average treatment effect: Hartung-Knapp
# 
# Average treatment effect [95%PI]:
#  -0.3287 [-0.9835, 0.3261]
# 
# Average treatment effect [95%CI]:
#  -0.3287 [-0.5625, -0.0950]
# 
# Heterogeneity variance (tau^2):
#  0.0700



