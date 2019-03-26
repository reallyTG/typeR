library(learningCurve)


### Name: unit_cum_exact
### Title: Exact Cumulative Unit Learning Curve Function
### Aliases: unit_cum_exact

### ** Examples

library(learningCurve)
# An estimator believes that the first unit of a product will 
# require 100 labor hours. How many total hours will be required
# for 125 units given the organization has historically experienced
# an 85% learning curve?

unit_cum_exact(t = 100, n = 125, r = .85)
## [1] 5201.085




