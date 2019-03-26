library(basicTrendline)


### Name: SSpower3P
### Title: Self-Starting Nls 'power3P' Regression Model
### Aliases: SSpower3P

### ** Examples

library(basicTrendline)
x<-1:5
y<-c(2,4,8,20,25)
xy<-data.frame(x,y)
getInitial(y ~ SSpower3P(x,a,b,c), data = xy)
## Initial values are in fact the converged values

fitpower3P <- nls(y~SSpower3P(x,a,b,c), data=xy)
summary(fitpower3P)




