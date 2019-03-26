library(WVPlots)


### Name: ShadedDensity
### Title: Plot the distribution of a variable with a tail shaded
### Aliases: ShadedDensity

### ** Examples


set.seed(52523)
d = data.frame(meas=rnorm(100))
threshold = -1.5
WVPlots::ShadedDensity(d, "meas", threshold,
                       title="Example shaded density plot, left tail")
WVPlots::ShadedDensity(d, "meas", -threshold, tail="right",
                       title="Example shaded density plot, right tail")




