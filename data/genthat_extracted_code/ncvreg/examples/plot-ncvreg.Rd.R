library(ncvreg)


### Name: plot.ncvreg
### Title: Plot coefficients from a ncvreg object
### Aliases: plot.ncvreg

### ** Examples

data(Prostate)

fit <- ncvreg(Prostate$X, Prostate$y)
plot(fit)
plot(fit, col="black")
plot(fit, log=TRUE)



