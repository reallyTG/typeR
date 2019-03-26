library(VGAM)


### Name: leipnik
### Title: Leipnik Distribution Family Function
### Aliases: leipnik
### Keywords: models regression

### ** Examples

ldata <- data.frame(y = rnorm(n = 2000, mean = 0.5, sd = 0.1))  # Not proper data
fit <- vglm(y ~ 1, leipnik(ilambda = 1), data = ldata, trace = TRUE)
head(fitted(fit))
with(ldata, mean(y))
summary(fit)
coef(fit, matrix = TRUE)
Coef(fit)

sum(weights(fit))  # Sum of the prior weights
sum(weights(fit, type = "work"))  # Sum of the working weights



