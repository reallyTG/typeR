library(BootMRMR)


### Name: mbmr.weight.cutoff
### Title: Identification of informative geneset based on weights obtained
###   from Modified Bootstrap-MRMR technique
### Aliases: mbmr.weight.cutoff
### Keywords: gene weights informative geneset Modified Bootstrap-MRMR

### ** Examples

data(rice_salt)
x=as.data.frame(rice_salt[-1,])
y=as.numeric(rice_salt[1,])
m=36
s=80
n=20
mbmr.weight.cutoff(x, y, m, s, n)



