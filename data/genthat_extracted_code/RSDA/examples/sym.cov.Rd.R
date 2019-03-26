library(RSDA)


### Name: sym.cov
### Title: Symbolic Covariance
### Aliases: sym.cov
### Keywords: Covariance Symbolic

### ** Examples

data(example3)
sym.data<-example3
sym.cov(sym.var(sym.data,1),sym.var(sym.data,4),method='centers')
sym.cov(sym.var(sym.data,2),sym.var(sym.data,6),method='centers')
sym.cov(sym.var(sym.data,2),sym.var(sym.data,6),method='billard')




