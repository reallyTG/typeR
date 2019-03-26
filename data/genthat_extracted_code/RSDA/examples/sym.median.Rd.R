library(RSDA)


### Name: sym.median
### Title: Symbolic Median
### Aliases: sym.median
### Keywords: Median Symbolic

### ** Examples

data(example3)
sym.data<-example3
sym.median(sym.var(sym.data,1))
sym.median(sym.var(sym.data,2))
sym.median(sym.var(sym.data,6),method='interval')
sym.median(sym.var(sym.data,3),method='modal')



