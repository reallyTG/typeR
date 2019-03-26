library(BootMRMR)


### Name: pval.mbmr
### Title: Computation of statistical significance values for genes using
###   Modified Bootstrap MRMR technique for a particular trait/condition
### Aliases: pval.mbmr
### Keywords: gene rankscore bootstrap p-value

### ** Examples

data(rice_salt)
x=as.data.frame(rice_salt[-1,])
y=as.numeric(rice_salt[1,])
m=36
s=80
Q=0.5
pval.mbmr(x, y, m, s, Q, plot=FALSE)



