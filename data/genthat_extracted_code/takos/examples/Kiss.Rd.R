library(takos)


### Name: Kiss
### Title: Title Kissinger
### Aliases: Kiss

### ** Examples

## No test: 
require(data.table)
require(MASS)
rates=c(0.5,1,2,5,10,20,50)
a<-lapply(rates, function(x) JMA(A=exp(35),Ea=120000,T0=0,T.end=300,q=x,npoints=5000,n=2))
a<-lapply(seq(1,length(a)), function(x) data.table(a[[x]]$time.s,a[[x]]$T.C,
a[[x]]$dadT, rates[[x]]))
lapply(seq(1,length(a)), function(x) setnames(a[[x]],
c("time.seconds","temperature.s","heat.flow","rates") ) )
ar<-testMat(a)
kiss<-Kiss(ar)
## End(No test)



