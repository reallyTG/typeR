library(WVPlots)


### Name: ShadedDensityCenter
### Title: Plot the distribution of a variable with a center region shaded
### Aliases: ShadedDensityCenter

### ** Examples


set.seed(52523)
d = data.frame(meas=rnorm(100))
boundaries = c(-1.5, 1.5)
WVPlots::ShadedDensityCenter(d, "meas", boundaries,
                       title="Example center-shaded density plot")




