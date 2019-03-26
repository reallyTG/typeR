library(MGLM)


### Name: BIC
### Title: Bayesian information criterion (BIC)
### Aliases: BIC BIC,MGLMfit-method BIC,MGLMreg-method
###   BIC,MGLMsparsereg-method BIC,MGLMtune-method

### ** Examples

set.seed(124)
n <- 200
d <- 4
alpha <- rep(1, d-1)
beta <- rep(1, d-1)
m <- 50
Y <- rgdirmn(n, m, alpha, beta)
gdmFit <- MGLMfit(Y, dist="GDM")
BIC(gdmFit)



