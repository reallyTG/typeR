library(pimeta)


### Name: pima_boot
### Title: A parametric bootstrap prediction interval
### Aliases: pima_boot bootPI

### ** Examples

data(sbp, package = "pimeta")
set.seed(20161102)
## No test: 
pimeta::pima_boot(sbp$y, sbp$sigmak, B = 50000)
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
# 



