library(DiscreteInverseWeibull)


### Name: ahrdiweibull
### Title: Alternative hazard rate function
### Aliases: ahrdiweibull
### Keywords: distribution

### ** Examples

q<-0.5
beta<-2
x<-1:10
y<-ahrdiweibull(x, q, beta)
y
plot(x,y,ylab="alt.hazard rate")



