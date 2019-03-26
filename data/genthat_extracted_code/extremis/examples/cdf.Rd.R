library(extremis)


### Name: cdf
### Title: Empirical Scedasis Distribution Function
### Aliases: cdf cdf.default

### ** Examples

data(sp500)
attach(sp500)
Y <- data.frame(date[-1], -diff(log(close)))
fit <- cdf(Y)
plot(fit)
plot(fit, original = FALSE)



