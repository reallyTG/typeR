library(seqmon)


### Name: seqmon
### Title: Generic function that calculates the cumulative alpha and beta
###   spending
### Aliases: seqmon

### ** Examples

t<-c(0.33,0.67,1)
f<- function(t) 0.025*t^4
g<-function(t) 0.20*t^3
a<-f(t)
b<-g(t)
seqmon(a, b, t, int = rep(500, length(t)))



