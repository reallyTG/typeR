library(seqmon)


### Name: alphaspend
### Title: Function that calculates the upper boundaries for efficacy
### Aliases: alphaspend

### ** Examples


f<- function(t) 0.025*t^4
t<-c(0.33,0.67,1)
cum_probs<-f(t)
alphaspend(levels=cum_probs,t,int=rep(500, length(t)),tol=0.005)




