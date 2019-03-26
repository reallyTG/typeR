library(VGAM)


### Name: felix
### Title: Felix Distribution Family Function
### Aliases: felix
### Keywords: models regression

### ** Examples

fdata <- data.frame(y = 2 * rpois(n = 200, 1) + 1)  # Not real data!
fit <- vglm(y ~ 1, felix, data = fdata, trace = TRUE, crit = "coef")
coef(fit, matrix = TRUE)
Coef(fit)
summary(fit)



