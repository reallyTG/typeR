library(rrpack)


### Name: rrr
### Title: Multivariate reduced-rank linear regression
### Aliases: rrr

### ** Examples

library(rrpack)
p <- 50; q <- 50; n <- 100; nrank <- 3
mydata <- rrr.sim1(n, p, q, nrank, s2n = 1, sigma = NULL,
                   rho_X = 0.5, rho_E = 0.3)
rfit <- with(mydata, rrr(Y, X, maxrank = 10))
summary(rfit)
coef(rfit)
plot(rfit)



