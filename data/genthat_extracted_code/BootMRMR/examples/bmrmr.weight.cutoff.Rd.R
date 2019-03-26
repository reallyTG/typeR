library(BootMRMR)


### Name: bmrmr.weight.cutoff
### Title: Selection of informative geneset using gene weights obtained
###   from the Bootstrap-MRMR technique
### Aliases: bmrmr.weight.cutoff
### Keywords: gene weights informative geneset Bootstrap MRMR

### ** Examples

data(rice_salt)
x=as.data.frame(rice_salt[-1,])
y=as.numeric(rice_salt[1,])
s=80
n=20
bmrmr.weight.cutoff(x, y, s, n)



