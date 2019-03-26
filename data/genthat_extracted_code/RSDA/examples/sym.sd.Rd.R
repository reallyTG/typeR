library(RSDA)


### Name: sym.sd
### Title: Symbolic Standard Desviation
### Aliases: sym.sd
### Keywords: Symbolic sd

### ** Examples

data(example3)
sym.data<-example3
sym.sd(sym.var(sym.data,1))
sym.sd(sym.var(sym.data,2))
sym.sd(sym.var(sym.data,6))
sym.sd(sym.var(sym.data,6),method='interval')
sym.sd(sym.var(sym.data,6),method='billard')
sym.sd(sym.var(sym.data,3),method='modal')



