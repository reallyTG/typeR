library(pimeta)


### Name: pima_hts
### Title: Higgins-Thompson-Spiegelhalter prediction interval
### Aliases: pima_hts htsdl

### ** Examples

data(sbp, package = "pimeta")
pimeta::pima_hts(sbp$y, sbp$sigmak)
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
# 



