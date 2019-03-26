library(normalp)


### Name: lmp
### Title: Fitted linear model with exponential power distribution errors
### Aliases: lmp lmp.default
### Keywords: regression

### ** Examples

e<-rnormp(n=100,mu=0,sigmap=4,p=3,method="d")
x<-runif(100)
y<-0.5+2*x+e
lmp(y~x)



