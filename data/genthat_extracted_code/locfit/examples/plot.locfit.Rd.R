library(locfit)


### Name: plot.locfit
### Title: Plot an object of class locfit.
### Aliases: plot.locfit
### Keywords: methods

### ** Examples

x <- rnorm(100)
y <- dnorm(x) + rnorm(100) / 5
plot(locfit(y~x), band="global")
x <- cbind(rnorm(100), rnorm(100))
plot(locfit(~x), type="persp")



