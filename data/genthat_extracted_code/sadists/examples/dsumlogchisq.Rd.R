library(sadists)


### Name: sumlogchisq
### Title: The sum of the logs of (non-central) chi-squares distribution.
### Aliases: dsumlogchisq psumlogchisq qsumlogchisq rsumlogchisq
###   sumlogchisq
### Keywords: distribution

### ** Examples

wts <- c(1,-3,4)
df <- c(100,20,10)
ncp <- c(5,3,1)
rvs <- rsumlogchisq(128, wts, df, ncp)
dvs <- dsumlogchisq(rvs, wts, df, ncp)
qvs <- psumlogchisq(rvs, wts, df, ncp)
pvs <- qsumlogchisq(ppoints(length(rvs)), wts, df, ncp)



