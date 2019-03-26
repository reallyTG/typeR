library(learningCurve)


### Name: unit_cum_appx
### Title: Approximate Cumulative Unit Learning Curve Function
### Aliases: unit_cum_appx

### ** Examples

library(learningCurve)
# An estimator believes that the first unit of a product will 
# require 100 labor hours. How many total hours will be required
# for 125 units given the organization has historically experienced
# an 85% learning curve?

unit_cum_appx(t = 100, n = 125, r = .85)
## [1] 5202.998

# Computational difference between unit_cum_exact() and unit_cum_appx() 
# for 1 million units

system.time(unit_cum_exact(t = 100, n = 1000000, r = .85))
##  user  system elapsed 
## 0.105   0.004   0.109

system.time(unit_cum_appx(t = 100, n = 1000000, r = .85))
## user  system elapsed 
##  0       0       0




