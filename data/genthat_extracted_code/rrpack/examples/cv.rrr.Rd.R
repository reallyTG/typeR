library(rrpack)


### Name: cv.rrr
### Title: Reduced-rank regression with rank selected by cross validation
### Aliases: cv.rrr

### ** Examples

library(rrpack)
p <- 50; q <- 50; n <- 100; nrank <- 3
mydata <- rrr.sim1(n, p, q, nrank, s2n = 1, sigma = NULL,
                   rho_X = 0.5, rho_E = 0.3)
rfit_cv <- with(mydata, cv.rrr(Y, X, nfold = 10, maxrank = 10))
summary(rfit_cv)
coef(rfit_cv)



