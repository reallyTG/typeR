library(copula)


### Name: margCopula
### Title: Marginal copula of a Copula With Specified Margins
### Aliases: margCopula margCopula,archmCopula,logical-method
###   margCopula,normalCopula,logical-method
###   margCopula,tCopula,logical-method
### Keywords: models multivariate

### ** Examples

tc <- tCopula(8:2 / 10, dim = 8, dispstr = "toep")
margCopula(tc, c(TRUE, TRUE, FALSE, TRUE, FALSE, FALSE, TRUE, FALSE))

nc <- normalCopula(.8, dim = 8, dispstr = "ar1")
mnc <- margCopula(nc, c(TRUE, TRUE, FALSE, TRUE, FALSE, FALSE, TRUE, FALSE))
mnc7 <- margCopula(nc, (1:8) != 1)
stopifnot(dim(nc) == 8, dim(mnc) == 4, dim(mnc7) == 7)

gc <- gumbelCopula(2, dim = 8)
margCopula(gc, c(TRUE, TRUE, TRUE, FALSE, FALSE, FALSE, FALSE, FALSE))



