library(rrpack)


### Name: srrr
### Title: Row-sparse reduced-eank regresssion
### Aliases: srrr

### ** Examples

library(rrpack)
p <- 100; n <- 100; nrank <- 3
mydata <- rrr.sim2(n, p, p0 = 10,q = 50, q0 = 10, nrank = 3,
                   s2n = 1, sigma = NULL, rho_X = 0.5, rho_E = 0)
fit1 <- with(mydata, srrr(Y, X, nrank = 3))
summary(fit1)
coef(fit1)
plot(fit1)



