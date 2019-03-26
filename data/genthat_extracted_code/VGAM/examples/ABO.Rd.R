library(VGAM)


### Name: ABO
### Title: The ABO Blood Group System
### Aliases: ABO
### Keywords: models regression

### ** Examples

ymat <- cbind(A = 725, B = 258, AB = 72, O = 1073)  # Order matters, not the name
fit <- vglm(ymat ~ 1, ABO(link.pA = "identitylink",
                          link.pB = "identitylink"), trace = TRUE,
            crit = "coef")
coef(fit, matrix = TRUE)
Coef(fit)  # Estimated pA and pB
rbind(ymat, sum(ymat) * fitted(fit))
sqrt(diag(vcov(fit)))



