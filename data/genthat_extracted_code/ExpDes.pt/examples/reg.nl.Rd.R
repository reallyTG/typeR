library(ExpDes.pt)


### Name: reg.nl
### Title: Regressao Nao-linear
### Aliases: reg.nl

### ** Examples

data(ex_nl)
attach(ex_nl)
x<-dic(trat, resp, quali=FALSE, nl=TRUE)
par(mfrow=c(1,2))
graficos(x, grau='pot')
graficos(x, grau='exp')



