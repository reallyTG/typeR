library(sievePH)


### Name: testDensRatioGOF
### Title: Goodness-of-Fit Test of the Validity of a Univariate or
###   Multivariate Mark Density Ratio Model
### Aliases: testDensRatioGOF

### ** Examples

n <- 500
tx <- rep(0:1, each=n/2)
tm <- c(rexp(n/2, 0.2), rexp(n/2, 0.2 * exp(-0.4)))
cens <- runif(n, 0, 15)
eventTime <- pmin(tm, cens, 3)
eventInd <- as.numeric(tm <= pmin(cens, 3))
mark1 <- ifelse(eventInd==1, c(rbeta(n/2, 2, 5), rbeta(n/2, 2, 2)), NA)
mark2 <- ifelse(eventInd==1, c(rbeta(n/2, 1, 3), rbeta(n/2, 5, 1)), NA)

# test goodness-of-fit for a univariate mark
testDensRatioGOF(eventInd, mark1, tx, iter=20)

# test goodness-of-fit for a bivariate mark
testDensRatioGOF(eventInd, data.frame(mark1, mark2), tx, iter=20)




