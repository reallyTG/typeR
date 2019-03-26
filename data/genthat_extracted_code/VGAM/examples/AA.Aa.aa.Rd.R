library(VGAM)


### Name: AA.Aa.aa
### Title: The AA-Aa-aa Blood Group System
### Aliases: AA.Aa.aa
### Keywords: models regression

### ** Examples

y <- cbind(53, 95, 38)
fit1 <- vglm(y ~ 1, AA.Aa.aa, trace = TRUE)
fit2 <- vglm(y ~ 1, AA.Aa.aa(inbreeding = TRUE), trace = TRUE)
rbind(y, sum(y) * fitted(fit1))
Coef(fit1)  # Estimated pA
Coef(fit2)  # Estimated pA and f
summary(fit1)



