library(RSDA)


### Name: sym.cor
### Title: Symbolic Correlation
### Aliases: sym.cor
### Keywords: Correlation Symbolic

### ** Examples

data(example3)
sym.data<-example3
sym.cor(sym.var(sym.data,1),sym.var(sym.data,4),method='centers')
sym.cor(sym.var(sym.data,2),sym.var(sym.data,6),method='centers')
sym.cor(sym.var(sym.data,2),sym.var(sym.data,6),method='billard')



