library(optimStrat)


### Name: gk
### Title: Computes the gk
### Aliases: gk
### Keywords: survey

### ** Examples

x1<- 1 + sort( rgamma(5000, shape=4/9, scale=108) )
x2<- 1 + sort( rgamma(5000, shape=4/9, scale=108) )
x3<- 1 + sort( rgamma(5000, shape=4/9, scale=108) )
x<- cbind(x1,x2,x3)
gk(x,Beta21=c(1,2,-1),Beta22=c(1,0.75,0.5))



