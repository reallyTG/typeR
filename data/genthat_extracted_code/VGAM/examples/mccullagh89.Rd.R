library(VGAM)


### Name: mccullagh89
### Title: McCullagh (1989) Distribution Family Function
### Aliases: mccullagh89
### Keywords: models regression

### ** Examples

mdata <- data.frame(y = rnorm(n = 1000, sd = 0.2))  # Limit as theta = 0, nu = Inf
fit <- vglm(y ~ 1, mccullagh89, data = mdata, trace = TRUE)
head(fitted(fit))
with(mdata, mean(y))
summary(fit)
coef(fit, matrix = TRUE)
Coef(fit)



