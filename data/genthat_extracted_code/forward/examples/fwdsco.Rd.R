library(forward)


### Name: fwdsco
### Title: Forward Search Transformation in Linear Regression
### Aliases: fwdsco print.fwdsco
### Keywords: robust regression models

### ** Examples

data(wool)
mod <- fwdsco(y ~ x1 + x2 + x3, data = wool)
summary(mod)
plot(mod, plot.mle=FALSE)
plot(mod, plot.Sco=FALSE, plot.Lik=TRUE)



