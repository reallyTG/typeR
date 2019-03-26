library(RSDA)


### Name: median.sym.data.table
### Title: Symbolic Median
### Aliases: median.sym.data.table
### Keywords: Median Symbolic

### ** Examples

data(example3)
sym.data<-example3
median(sym.data[,2])
median(sym.data[,6] ,method='interval')
median(sym.data[,3] ,method='modal')



