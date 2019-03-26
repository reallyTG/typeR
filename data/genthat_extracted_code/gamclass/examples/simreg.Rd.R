library(gamclass)


### Name: simreg
### Title: Simulate (repeated) regression calculations
### Aliases: simreg bootreg
### Keywords: models regression

### ** Examples

xy <- data.frame(x=rnorm(100), y=rnorm(100))
simcoef <- simreg(formula = y~x, data = xy, nsim = 100)
bootcoef <- bootreg(formula = y~x, data = xy, nboot = 100)



