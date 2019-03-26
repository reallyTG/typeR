library(VGAM)


### Name: dirichlet
### Title: Fitting a Dirichlet Distribution
### Aliases: dirichlet
### Keywords: models regression

### ** Examples

ddata <- data.frame(rdiric(n = 1000,
                           shape = exp(c(y1 = -1, y2 = 1, y3 = 0))))
fit <- vglm(cbind(y1, y2, y3)  ~ 1, dirichlet,
            data = ddata, trace = TRUE, crit = "coef")
Coef(fit)
coef(fit, matrix = TRUE)
head(fitted(fit))



