library(mets)


### Name: dlag
### Title: Lag operator
### Aliases: dlag dlag<-

### ** Examples

d <- data.frame(y=1:10,x=c(10:1))
dlag(d,k=1:2)
dlag(d,~x,k=0:1)
dlag(d$x,k=1)
dlag(d$x,k=-1:2, names=letters[1:4])



