library(RSDA)


### Name: sym.scatterplot
### Title: sym.scatterplot
### Aliases: sym.scatterplot sym.scatterplot
### Keywords: Plot Symbolic internal

### ** Examples

data(example3)
sym.data <- example3
class(sym.data) <- c('sym.data.table')
sym.scatterplot(sym.data[,1], sym.data[,4],col='blue',
                main='Main Title')
sym.scatterplot(sym.data[,1], sym.data[,4],labels=TRUE,col='blue',
                main='Main Title')
sym.scatterplot(sym.data[,2], sym.data[,6],labels=TRUE,
                col='red',main='Main Title',lwd=3)

data(oils)
sym.scatterplot(oils[,2],oils[,3],labels=TRUE,
                col='red',main='Oils Data')
data(lynne1)

sym.scatterplot(lynne1[,2],lynne1[,1],labels=TRUE,
                col='red',main='Lynne Data')




