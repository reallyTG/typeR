library(BootMRMR)


### Name: bmrmr.pval.cutoff
### Title: Selection of informative geneset based on statistical
###   significance value using Bootstrap-MRMR technique
### Aliases: bmrmr.pval.cutoff
### Keywords: gene rankscore bootstrap p-value informative geneset

### ** Examples

data(rice_salt)
x=as.data.frame(rice_salt[-1,])
y=as.numeric(rice_salt[1,])
s=80
Q=0.5
n=20
bmrmr.pval.cutoff(x, y, s, Q, n)



