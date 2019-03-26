library(stratbr)


### Name: stratbr
### Title: Optimization Algorithm to solve stratification problem
### Aliases: stratbr

### ** Examples

data(Sweden)
REV84<-Sweden[,9]
solution1<-stratbr(REV84,H=3,n=50,nmin=10,totgen=2,cores=4)
data(USbanks)
solution2<-stratbr(USbanks,H=3,n=50,totgen=2,cores=4,takeall=TRUE)



