library(RSDA)


### Name: sd
### Title: Generic function for the standard desviation
### Aliases: sd sd.default sd.sym.data.table
### Keywords: Symbolic sd

### ** Examples

data(example3)
sym.data<-example3
sd(sym.data[,1])
sd(sym.data[,2])
sd(sym.data[,6])
sd(sym.data[,6], method='interval')
sd(sym.data[,6], method='billard')
sd(sym.data[,3],method='modal')



