library(basicTrendline)


### Name: SSexp2P
### Title: Self-Starting Nls 'exp2P' Regression Model
### Aliases: SSexp2P

### ** Examples

library(basicTrendline)
x<-1:5
y<-c(2,4,8,20,25)
xy<-data.frame(x,y)
getInitial(y ~ SSexp2P(x,a,b), data = xy)
## Initial values are in fact the converged values

fitexp2P <- nls(y~SSexp2P(x,a,b), data=xy)
summary(fitexp2P)




