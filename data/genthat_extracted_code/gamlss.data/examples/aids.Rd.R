library(gamlss.data)


### Name: aids
### Title: Aids Cases in England and Wales
### Aliases: aids
### Keywords: datasets

### ** Examples

data(aids)
attach(aids)
plot(x,y,pch=21,bg=c("red","green3","blue","yellow")[unclass(qrt)])
detach(aids)



