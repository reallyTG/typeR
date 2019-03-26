library(pdR)


### Name: IGF
### Title: Unit root test based on Change(2002)
### Aliases: IGF
### Keywords: instrument generating functions unit root

### ** Examples

data(inf19)
y <- inf19[,1]
IGF(y,maxp=35,ic="BIC",spec=2)$tstat.IGF




