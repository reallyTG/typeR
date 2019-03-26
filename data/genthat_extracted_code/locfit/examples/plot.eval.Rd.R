library(locfit)


### Name: plot.eval
### Title: Plot evaluation points from a 2-d locfit object.
### Aliases: plot.eval
### Keywords: smooth

### ** Examples

data(ethanol, package="locfit")
fit <- locfit(NOx ~ E + C, data=ethanol, scale=0)
plot.eval(fit)



