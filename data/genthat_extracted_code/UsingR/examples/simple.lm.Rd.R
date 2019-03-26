library(UsingR)


### Name: simple.lm
### Title: Simplify usage of lm
### Aliases: simple.lm
### Keywords: regression

### ** Examples

## on simulated data
x<-1:10
y<-5*x + rnorm(10,0,1)
tmp<-simple.lm(x,y)
summary(tmp)

## predict values
simple.lm(x,y,pred=c(5,6,7))



