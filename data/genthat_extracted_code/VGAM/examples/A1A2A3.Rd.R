library(VGAM)


### Name: A1A2A3
### Title: The A1A2A3 Blood Group System
### Aliases: A1A2A3
### Keywords: models regression

### ** Examples

ymat <- cbind(108, 196, 429, 143, 513, 559)
fit <- vglm(ymat ~ 1, A1A2A3(link = probit), trace = TRUE, crit = "coef")
fit <- vglm(ymat ~ 1, A1A2A3(link = logit, ip1 = 0.3, ip2 = 0.3, iF = 0.02),
            trace = TRUE, crit = "coef")
Coef(fit)  # Estimated p1 and p2
rbind(ymat, sum(ymat) * fitted(fit))
sqrt(diag(vcov(fit)))



