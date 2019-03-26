library(VGAM)


### Name: Paralogistic
### Title: The Paralogistic Distribution
### Aliases: Paralogistic dparalogistic pparalogistic qparalogistic
###   rparalogistic
### Keywords: distribution

### ** Examples

pdata <- data.frame(y = rparalogistic(n = 3000, scale = exp(1), exp(2)))
fit <- vglm(y ~ 1, paralogistic(lss = FALSE, ishape1.a = 4.1),
            data = pdata, trace = TRUE)
coef(fit, matrix = TRUE)
Coef(fit)



