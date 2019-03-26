library(BootMRMR)


### Name: mbmr.pval.cutoff
### Title: Selection of informative geneset based on statistical
###   significance value using Modified Bootstrap MRMR technique
### Aliases: mbmr.pval.cutoff
### Keywords: gene rankscore bootstrap p-value informative geneset

### ** Examples

data(rice_salt)
x=as.data.frame(rice_salt[-1,])
y=as.numeric(rice_salt[1,])
m=36
s=80
Q=0.5
n=20
mbmr.pval.cutoff(x, y, m, s, Q, n)



