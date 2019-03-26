library(locfit)


### Name: cpar
### Title: Conditionally parametric term for a Locfit model.
### Aliases: cpar
### Keywords: models

### ** Examples

data(ethanol, package="locfit")
# fit a conditionally parametric model
fit <- locfit(NOx ~ lp(E, C, style=c("n","cpar")), data=ethanol)
plot(fit)
# one way to force a parametric fit with locfit
fit <- locfit(NOx ~ cpar(E), data=ethanol)



