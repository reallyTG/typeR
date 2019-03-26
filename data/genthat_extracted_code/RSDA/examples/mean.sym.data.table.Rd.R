library(RSDA)


### Name: mean.sym.data.table
### Title: Symbolic Mean
### Aliases: mean.sym.data.table
### Keywords: Mean Symbolic

### ** Examples

data(example3)
sym.data<-example3
mean(sym.data[,1])
mean(sym.data[,2])
mean(sym.data[,2], method='interval')
mean(sym.data[,3], method='modal')




