library(sievePH)


### Name: testIndepTimeMark
### Title: Kolmogorov-Smirnov-Type Test of Conditional Independence between
###   the Time-to-Event and a Multivariate Mark Given Treatment
### Aliases: testIndepTimeMark

### ** Examples

n <- 500
tx <- rep(0:1, each=n/2)
tm <- c(rexp(n/2, 0.2), rexp(n/2, 0.2 * exp(-0.4)))
cens <- runif(n, 0, 15)
eventTime <- pmin(tm, cens, 3)
eventInd <- as.numeric(tm <= pmin(cens, 3))
mark1 <- ifelse(eventInd==1, c(rbeta(n/2, 2, 5), rbeta(n/2, 2, 2)), NA)
mark2 <- ifelse(eventInd==1, c(rbeta(n/2, 1, 3), rbeta(n/2, 5, 1)), NA)

# perform the test for a univariate mark in the placebo group
testIndepTimeMark(data.frame(eventTime, eventInd, mark1)[tx==0, ], iter=20)

# perform the test for a bivariate mark in the placebo group
testIndepTimeMark(data.frame(eventTime, eventInd, mark1, mark2)[tx==0, ], iter=20)




