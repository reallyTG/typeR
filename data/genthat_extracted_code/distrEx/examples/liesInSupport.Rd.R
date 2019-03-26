library(distrEx)


### Name: liesInSupport
### Title: Generic Function for Testing the Support of a Distribution
### Aliases: liesInSupport,DiscreteMVDistribution,numeric-method
###   liesInSupport,DiscreteMVDistribution,matrix-method
### Keywords: distribution utilities methods

### ** Examples

M <- matrix(rpois(30, lambda = 10), ncol = 3)
D1 <- DiscreteMVDistribution(M)
M1 <- rbind(r(D1)(10), matrix(rpois(30, lam = 10), ncol = 3))
liesInSupport(D1, M1)



