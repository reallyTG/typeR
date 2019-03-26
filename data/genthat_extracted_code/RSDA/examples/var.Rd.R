library(RSDA)


### Name: var
### Title: Generic function for the Variance
### Aliases: var var.default var.sym.data.table
### Keywords: Symbolic Variance

### ** Examples

data(example3)
sym.data<-example3
var(sym.data[,1])
var(sym.data[,2])
var(sym.data[,6])
var(sym.data[,6], method='interval')
var(sym.data[,6], method='billard')
var(sym.data[,3], method='modal')



