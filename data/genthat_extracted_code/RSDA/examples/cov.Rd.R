library(RSDA)


### Name: cov
### Title: Generic function for the covariance
### Aliases: cov cov.default cov.sym.data.table
### Keywords: Covariance Symbolic

### ** Examples

data(example3)
sym.data <- example3
cov(sym.data[,1], sym.data[,4], method='centers')
cov(sym.data[,2],sym.data[,6], method='centers')
cov(sym.data[,2],sym.data[,6], method='billard')




