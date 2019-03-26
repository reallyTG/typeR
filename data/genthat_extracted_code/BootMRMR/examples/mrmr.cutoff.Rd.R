library(BootMRMR)


### Name: mrmr.cutoff
### Title: Informative geneset selection using MRMR weights
### Aliases: mrmr.cutoff
### Keywords: gene weights informative geneset MRMR

### ** Examples

data(rice_salt)
x=as.data.frame(rice_salt[-1,])
y=as.numeric(rice_salt[1,])
n=20
mrmr.cutoff(x, y, n)



