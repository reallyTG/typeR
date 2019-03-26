library(optimStrat)


### Name: expmsepips
### Title: Anticipated Mean Squared Error of a PIps design
### Aliases: expmsepips
### Keywords: survey

### ** Examples

x1<- 1 + sort( rgamma(5000, shape=4/9, scale=108) )
x2<- 1 + sort( rgamma(5000, shape=4/9, scale=108) )
x3<- 1 + sort( rgamma(5000, shape=4/9, scale=108) )
x<- cbind(x1,x2,x3)
expmsepips(x,pik=x3,n=150,Beta11=c(1,-1,0),Beta12=c(1,1,0),Beta21=c(0,0,1),
   Beta22=c(0,0,0.5),Delta12=c(1,1,0),Rfy=0.8)
expmsepips(x,pik=x3,n=150,Beta11=c(1,-1,0),Beta12=c(1,1,0),Beta21=c(0,0,1),
   Beta22=c(0,0,0.5),Delta12=c(1,1,1),Rfy=0.8)



