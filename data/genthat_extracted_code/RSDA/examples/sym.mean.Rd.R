library(RSDA)


### Name: sym.mean
### Title: Symbolic Mean
### Aliases: sym.mean
### Keywords: Mean Symbolic

### ** Examples

data(example3)
sym.data<-example3
sym.mean(sym.var(sym.data,1))
sym.mean(sym.var(sym.data,2))
sym.mean(sym.var(sym.data,2),method='interval')
sym.mean(sym.var(sym.data,3),method='modal')




