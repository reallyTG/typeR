library(VGAM)


### Name: bifgmexp
### Title: Bivariate Farlie-Gumbel-Morgenstern Exponential Distribution
###   Family Function
### Aliases: bifgmexp
### Keywords: models regression

### ** Examples

N <- 1000; mdata <- data.frame(y1 = rexp(N), y2 = rexp(N))
## Not run: plot(ymat)
fit <- vglm(cbind(y1, y2) ~ 1, bifgmexp, data = mdata, trace = TRUE)
fit <- vglm(cbind(y1, y2) ~ 1, bifgmexp, data = mdata, # This may fail
            trace = TRUE, crit = "coef")
coef(fit, matrix = TRUE)
Coef(fit)
head(fitted(fit))



