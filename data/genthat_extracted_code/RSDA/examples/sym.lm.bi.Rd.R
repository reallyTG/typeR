library(RSDA)


### Name: sym.lm.bi
### Title: Symbolic Linear Regression for two variables.
### Aliases: sym.lm.bi
### Keywords: Regression Symbolic

### ** Examples

data(example3)
sym.data<-example3
class(sym.data) <- c('sym.data.table')
lm.mod<-sym.lm.bi(sym.var(sym.data,1),sym.var(sym.data,4))
sym.scatterplot(sym.data[,1],sym.data[,4],col='blue',
                main='Linear Regression')
abline(lm.mod,lwd=3)

lm.mod<-sym.lm.bi(sym.var(sym.data,2),sym.var(sym.data,6))
sym.scatterplot(sym.data[,2],sym.data[,6],
                col='blue',main='Linear Regression')
abline(lm.mod,lwd=3)

data(lynne1)
sym.data<-lynne1
class(sym.data) <- c('sym.data.table')
lm.mod<-sym.lm.bi(sym.var(lynne1,2),sym.var(lynne1,1))
sym.scatterplot(sym.data[,2],sym.data[,1],labels=TRUE,
                col='red',main='Linear Regression')
abline(lm.mod,lwd=3,col='blue')

lm.mod<-sym.lm.bi(sym.var(lynne1,2),sym.var(lynne1,1),method='inf-sup')
sym.scatterplot(sym.data[,2],sym.data[,1],labels=TRUE,
                col='red',main='Linear Regression')
abline(lm.mod$inf,lwd=3,col='blue')
abline(lm.mod$sup,lwd=3,col='blue')

lm.mod<-sym.lm.bi(sym.var(lynne1,2),sym.var(lynne1,1),method='tops')
sym.scatterplot(sym.data[,2],sym.data[,1],labels=TRUE,
                col='red',main='Linear Regression')
abline(lm.mod,lwd=3,col='blue')

lm.mod<-sym.lm.bi(sym.var(lynne1,2),sym.var(lynne1,1),method='billard')
sym.scatterplot(sym.data[,2],sym.data[,1],labels=TRUE,
                col='red',main='Linear Regression')
abline(lm.mod$Intercept,lm.mod$Beta1,lwd=3,col='blue')



