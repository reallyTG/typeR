library(VGAM)


### Name: inv.binomial
### Title: Inverse Binomial Distribution Family Function
### Aliases: inv.binomial
### Keywords: models regression

### ** Examples

idata <- data.frame(y = rnbinom(n <- 1000, mu = exp(3), size = exp(1)))
fit <- vglm(y ~ 1, inv.binomial, data = idata, trace = TRUE)
with(idata, c(mean(y), head(fitted(fit), 1)))
summary(fit)
coef(fit, matrix = TRUE)
Coef(fit)
sum(weights(fit))  # Sum of the prior weights
sum(weights(fit, type = "work"))  # Sum of the working weights



