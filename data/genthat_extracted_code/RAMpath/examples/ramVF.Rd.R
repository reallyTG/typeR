library(RAMpath)


### Name: ramVF
### Title: Generate a vector field plot based on the bivariate lcsm
### Aliases: ramVF

### ** Examples

data(ex3)
test.blcs<-ramBLCS(ex3, 1:6, 7:12, ram.out=TRUE)
ramVF(test.blcs, c(0,80),c(0,80), length=.05, xlab='X', ylab='Y',scale=.5, ninterval=9)



