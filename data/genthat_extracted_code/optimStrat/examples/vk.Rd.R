library(optimStrat)


### Name: vk
### Title: Calculate the values of the function f.
### Aliases: vk
### Keywords: survey

### ** Examples

x1<- 1 + sort( rgamma(5000, shape=4/9, scale=108) )
x2<- 1 + sort( rgamma(5000, shape=4/9, scale=108) )
x3<- 1 + sort( rgamma(5000, shape=4/9, scale=108) )
x<- cbind(x1,x2,x3)
vk(x,Beta11=c(1,2,-1),Beta12=c(1,0.75,0.5),Delta12=c(1,0.75,0.5))



