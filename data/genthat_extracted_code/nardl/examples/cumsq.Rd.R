library(nardl)


### Name: cumsq
### Title: Function cumsq
### Aliases: cumsq

### ** Examples


reg<-nardl(food~inf,fod,ic="aic",maxlags = TRUE,graph = TRUE,case=3)
e<-reg$rece
k<-reg$k
n<-reg$n
cumsq(e=e,k=k,n=n)




