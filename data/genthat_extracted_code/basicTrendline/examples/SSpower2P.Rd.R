library(basicTrendline)


### Name: SSpower2P
### Title: Self-Starting Nls 'power2P' Regression Model
### Aliases: SSpower2P

### ** Examples

library(basicTrendline)
x<-1:5
y<-c(2,4,8,20,25)
xy<-data.frame(x,y)
getInitial(y ~ SSpower2P(x,a,b), data = xy)
## Initial values are in fact the converged values

fitpower2P <- nls(y~SSpower2P(x,a,b), data=xy)
summary(fitpower2P)




