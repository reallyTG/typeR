library(basicTrendline)


### Name: SSexp3P
### Title: Self-Starting Nls 'exp3P' Regression Model
### Aliases: SSexp3P

### ** Examples

library(basicTrendline)
x<-1:5
y<-c(2,4,8,16,28)
xy<-data.frame(x,y)
getInitial(y ~ SSexp3P(x,a,b,c), data = xy)
## Initial values are in fact the converged values

fitexp3P <- nls(y~SSexp3P(x,a,b,c), data=xy)
summary(fitexp3P)




