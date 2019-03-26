library(ftnonpar)


### Name: pmlogreg
### Title: Piecewise monotone logistic regression with taut strings
### Aliases: pmlogreg
### Keywords: smooth nonparametric regression models

### ** Examples

aaa<-rbinom(1024,1,0.5+0.5*sin(seq(0,10*pi,len=1024)))
pmlogreg(aaa,verbose=TRUE)$n



