library(learningCurve)


### Name: plot_unit_curve
### Title: Learning Curve Plot
### Aliases: plot_unit_curve

### ** Examples

# library(learningCurve)
# An estimator wants to plot the learning curve for for units 
# one through 125 where the first unit requires 100 hours and
# the learning rate is 85%.

# plot the time (or cost) per unit based on Crawford's Unit 
# Learning Curve Function
plot_unit_curve(t = 100, m = 1, n = 125, r = .85)

# plot the cumulative time (or cost) per unit based on Crawford's 
# Unit Learning Curve Function
plot_unit_curve(t = 100, m = 1, n = 125, r = .85, level = "c")

# plot the time (or cost) per unit based on Wright's Cumulative 
# Average Learning Curve Function
plot_unit_curve(t = 100, m = 1, n = 125, r = .85, model = "ca")

# plot the cumulative time (or cost) per unit based on Wrights's 
# Cumulative Average Learning Curve Function
plot_unit_curve(t = 100, m = 1, n = 125, r = .85, model = "ca", level = "c")




