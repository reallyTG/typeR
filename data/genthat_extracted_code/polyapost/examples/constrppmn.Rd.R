library(polyapost)


### Name: constrppmn
### Title: Estimating a population mean using the constrained Polya
###   posterior.
### Aliases: constrppmn
### Keywords: survey

### ** Examples

A1<-rbind(rep(1,6),1:6)
A2<-rbind(c(2,5,7,1,10,8),diag(-1,6))
b1<-c(1,3.5)
b2<-c(6,rep(0,6))
initsol<-rep(1/6,6)
rep<-1006
burnin<-1000
ysamp<-c(1,2.5,3.5,7,4.5,6)
out<-constrppmn(A1,A2,NULL,b1,b2,NULL,initsol,rep,ysamp,burnin)
out[[1]] # the Markov chain of the means.
out[[2]] # the average of out[[1]]
out[[3]] # the 2.5th and 97.5th quantiles of out[[1]]


