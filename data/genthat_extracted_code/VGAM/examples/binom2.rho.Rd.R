library(VGAM)


### Name: binom2.rho
### Title: Bivariate Probit Model (Family Function)
### Aliases: binom2.rho binom2.Rho
### Keywords: models regression

### ** Examples

coalminers <- transform(coalminers, Age = (age - 42) / 5)
fit <- vglm(cbind(nBnW, nBW, BnW, BW) ~ Age,
            binom2.rho, data = coalminers, trace = TRUE)
summary(fit)
coef(fit, matrix = TRUE)



