library(BootMRMR)


### Name: pval.bmrmr
### Title: Compuation of statistical significance values for genes using
###   Bootstrap-MRMR technique
### Aliases: pval.bmrmr
### Keywords: gene rankscore bootstrap p-value non-parametric test

### ** Examples

data(rice_salt)
x=as.data.frame(rice_salt[-1,])
y=as.numeric(rice_salt[1,])
s=80
Q=0.5
pval.bmrmr(x, y, s, Q, plot=FALSE)



