library(VGAM)


### Name: MNSs
### Title: The MNSs Blood Group System
### Aliases: MNSs
### Keywords: models regression

### ** Examples

# Order matters only:
y <- cbind(MS = 295, Ms = 107, MNS = 379, MNs = 322, NS = 102, Ns = 214)
fit <- vglm(y ~ 1, MNSs("logit", .25, .28, .08), trace = TRUE)
fit <- vglm(y ~ 1, MNSs(link = logit), trace = TRUE, crit = "coef")
Coef(fit)
rbind(y, sum(y)*fitted(fit))
sqrt(diag(vcov(fit)))



