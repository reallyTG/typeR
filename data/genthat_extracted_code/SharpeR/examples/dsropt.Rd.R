library(SharpeR)


### Name: dsropt
### Title: The (non-central) maximal Sharpe ratio distribution.
### Aliases: dsropt psropt qsropt rsropt
### Keywords: distribution

### ** Examples

# generate some variates 
ngen <- 128
ope <- 253
df1 <- 8
df2 <- ope * 10
drag <- 0
# sample
rvs <- rsropt(ngen, df1, df2, drag, ope)
hist(rvs)
# these should be uniform:
isp <- psropt(rvs, df1, df2, drag, ope)
plot(ecdf(isp))




