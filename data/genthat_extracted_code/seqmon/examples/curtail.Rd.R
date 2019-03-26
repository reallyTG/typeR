library(seqmon)


### Name: curtail
### Title: Generic function that calculates the probability to declare
###   efficacy at the end of study given the Z value at the current look
### Aliases: curtail

### ** Examples

t<-c(0.33,0.67,1)
f<- function(t) 0.025*t^4
g<-function(t) 0.20*t^3
a<-f(t)
b<-g(t)
noncen<-pnorm(0.975)+pnorm(0.8)
curtail(b,a,1,t,noncen)



