library(RAMpath)


### Name: ramBLCS
### Title: Conduct bivariate latent change score analysis
### Aliases: ramBLCS

### ** Examples

data(ex3)
## Test the bivariate latent change score model ramBLCS

test.blcs<-ramBLCS(ex3, 7:12, 1:6, ram.out=TRUE)
summary(test.blcs$lavaan, fit=TRUE)

bridge<-ramPathBridge(test.blcs$ram, allbridge=FALSE,indirect=FALSE)
plot(bridge, 'blcs')


## Test the vector field plot
## test.blcs is the output of the ramBLCS function.
ramVF(test.blcs, c(0,80),c(0,80), length=.05, xlab='X', ylab='Y',scale=.5, ninterval=9)



