library(VGAM)


### Name: AB.Ab.aB.ab
### Title: The AB-Ab-aB-ab Blood Group System
### Aliases: AB.Ab.aB.ab
### Keywords: models regression

### ** Examples

ymat <- cbind(AB=1997, Ab=906, aB=904, ab=32)  # Data from Fisher (1925)
fit <- vglm(ymat ~ 1, AB.Ab.aB.ab(link = "identitylink"), trace = TRUE)
fit <- vglm(ymat ~ 1, AB.Ab.aB.ab, trace = TRUE)
rbind(ymat, sum(ymat)*fitted(fit))
Coef(fit)  # Estimated p
p <- sqrt(4*(fitted(fit)[, 4]))
p*p
summary(fit)



