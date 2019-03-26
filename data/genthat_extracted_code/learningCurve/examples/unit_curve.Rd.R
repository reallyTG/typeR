library(learningCurve)


### Name: unit_curve
### Title: Crawford's Unit Learning Curve Function
### Aliases: unit_curve

### ** Examples

library(learningCurve)
# An estimator believes that the first unit of a product will 
# require 100 labor hours. How many hours will the 125th unit
# require given the organization has historically experienced
# an 85% learning curve?

unit_curve(t = 100, m = 1, n = 125, r = .85)
## [1] 32.23647

# If the estimator wants to assess the hours required for the
# 125 unit given multiple learning curve rates

r <- c(.8, .85, .9, .95)
unit_curve(t = 100, m = 1, n = 125, r = r)
## [1] 21.13225 32.23647 48.00243 69.95640

# If the estimator has the time required for the 100th unit
unit_curve(t = 100, m = 100, n = 125, r = .85)
## [1] 94.90257



