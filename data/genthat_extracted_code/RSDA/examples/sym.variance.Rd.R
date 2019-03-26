library(RSDA)


### Name: sym.variance
### Title: Symbolic Variance
### Aliases: sym.variance
### Keywords: Symbolic Variance

### ** Examples

data(example3)
sym.data<-example3
sym.variance(sym.var(sym.data,1))
sym.variance(sym.var(sym.data,2))
sym.variance(sym.var(sym.data,6))
sym.variance(sym.var(sym.data,6),method='interval')
sym.variance(sym.var(sym.data,6),method='billard')
sym.variance(sym.var(sym.data,3),method='modal')



