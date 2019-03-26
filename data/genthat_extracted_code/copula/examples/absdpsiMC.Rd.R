library(copula)


### Name: absdPsiMC
### Title: Absolute Value of Generator Derivatives via Monte Carlo
### Aliases: absdPsiMC psiDabsMC
### Keywords: distribution

### ** Examples

t <- c(0:100,Inf)
set.seed(1)
(ps <- absdPsiMC(t, family="Gumbel", theta=2, degree=10, n.MC=10000, log=TRUE))
## Note: The absolute value of the derivative at 0 should be Inf for
## Gumbel, however, it is always finite for the Monte Carlo approximation
set.seed(1)
ps2 <- absdPsiMC(log(t), family="Gumbel", theta=2, degree=10,
                 n.MC=10000, log=TRUE, is.log.t = TRUE)
stopifnot(all.equal(ps[-1], ps2[-1], tolerance=1e-14))
## Now is there an advantage of using "is.log.t" ?
sapply(eval(formals(absdPsiMC)$method), function(MM)
       absdPsiMC(780, family="Gumbel", method = MM,
                 theta=2, degree=10, n.MC=10000, log=TRUE, is.log.t = TRUE))
## not really better, yet...



