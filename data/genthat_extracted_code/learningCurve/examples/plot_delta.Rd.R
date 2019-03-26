library(learningCurve)


### Name: plot_delta
### Title: Crawford vs. Wright Delta Plot
### Aliases: plot_delta

### ** Examples

# The first unit of production is expected to require 50 hours and
# the learning rate is expected to be 88.5%. However, the estimator
# is not sure whether the learning rate is based on the unit model
# or cumulative average model and wants to understand the difference
# between potential outcomes for each unit.  

# Plot the differences between per unit time requirements
plot_delta(t = 50, m = 1, n = 25, r = .885)

# Plot the differences between cumulative time requirements
plot_delta(t = 50, m = 1, n = 25, r = .885, level = "c")




