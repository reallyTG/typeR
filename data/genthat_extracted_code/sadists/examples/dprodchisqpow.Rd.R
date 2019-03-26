library(sadists)


### Name: prodchisqpow
### Title: The product of (non-central) chi-squares raised to powers
###   distribution.
### Aliases: dprodchisqpow pprodchisqpow prodchisqpow qprodchisqpow
###   rprodchisqpow
### Keywords: distribution

### ** Examples

df <- c(100,20,10)
ncp <- c(5,3,1)
pow <- c(1,0.5,1)
rvs <- rprodchisqpow(128, df, ncp, pow)
dvs <- dprodchisqpow(rvs, df, ncp, pow)
qvs <- pprodchisqpow(rvs, df, ncp, pow)
pvs <- qprodchisqpow(ppoints(length(rvs)), df, ncp, pow)



