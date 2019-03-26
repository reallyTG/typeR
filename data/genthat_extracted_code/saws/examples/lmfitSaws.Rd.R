library(saws)


### Name: lmfitSaws
### Title: Linear model function to output extra objects for saws
### Aliases: lmfitSaws
### Keywords: htest

### ** Examples

set.seed(1)
n<-20
x1<-rnorm(n)
x2<-factor(c(rep("a",n/2),rep("b",n/2)))
y<-rnorm(n,x1)
out<-lmfitSaws(model.matrix(~x1*x2),y)
saws(out)



