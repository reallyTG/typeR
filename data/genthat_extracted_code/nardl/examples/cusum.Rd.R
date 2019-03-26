library(nardl)


### Name: cusum
### Title: Function cusum
### Aliases: cusum

### ** Examples


reg<-nardl(food~inf,fod,ic="aic",maxlags = TRUE,graph = TRUE,case=3)
e<-reg$rece
k<-reg$k
n<-reg$n
cusum(e=e,k=k,n=n)




