library(VGAM)


### Name: poisson.points
### Title: Poisson-points-on-a-plane/volume Distances Distribution
### Aliases: poisson.points
### Keywords: models regression

### ** Examples

pdata <- data.frame(y = rgamma(10, shape = exp(-1)))  # Not proper data!
ostat <- 2
fit <- vglm(y ~ 1, poisson.points(ostat, 2), data = pdata,
            trace = TRUE, crit = "coef")
fit <- vglm(y ~ 1, poisson.points(ostat, 3), data = pdata,
            trace = TRUE, crit = "coef")  # Slow convergence?
fit <- vglm(y ~ 1, poisson.points(ostat, 3, idensi = 1), data = pdata,
            trace = TRUE, crit = "coef")
head(fitted(fit))
with(pdata, mean(y))
coef(fit, matrix = TRUE)
Coef(fit)



