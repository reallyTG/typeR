library(RSDA)


### Name: cor
### Title: Generic function for the correlation
### Aliases: cor cor.default cor.sym.data.table
### Keywords: Correlation Symbolic

### ** Examples

data(example3)
sym.data <- example3
cor(sym.data[,1], sym.data[,4], method='centers')
cor(sym.data[,2], sym.data[,6], method='centers')
cor(sym.data[,2], sym.data[,6], method='billard')



