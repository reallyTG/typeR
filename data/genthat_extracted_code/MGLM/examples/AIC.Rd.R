library(MGLM)


### Name: AIC
### Title: Akaike's Information Criterion (AIC)
### Aliases: AIC AIC,MGLMfit-method AIC,MGLMreg-method
###   AIC,MGLMsparsereg-method AIC,MGLMtune-method

### ** Examples

set.seed(124)
n <- 200
d <- 4
alpha <- rep(1, d-1)
beta <- rep(1, d-1)
m <- 50
Y <- rgdirmn(n, m, alpha, beta)
gdmFit <- MGLMfit(Y, dist="GDM")
AIC(gdmFit)



