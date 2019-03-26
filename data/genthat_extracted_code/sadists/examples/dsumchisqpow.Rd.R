library(sadists)


### Name: sumchisqpow
### Title: The sum of (non-central) chi-squares raised to powers
###   distribution.
### Aliases: dsumchisqpow psumchisqpow qsumchisqpow rsumchisqpow
###   sumchisqpow
### Keywords: distribution

### ** Examples

wts <- c(1,-3,4)
df <- c(100,20,10)
ncp <- c(5,3,1)
pow <- c(1,0.5,1)
rvs <- rsumchisqpow(128, wts, df, ncp, pow)
dvs <- dsumchisqpow(rvs, wts, df, ncp, pow)
qvs <- psumchisqpow(rvs, wts, df, ncp, pow)
pvs <- qsumchisqpow(ppoints(length(rvs)), wts, df, ncp, pow)



