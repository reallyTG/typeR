library(gamlss)


### Name: gamlss.scope
### Title: Generate a Scope Argument for Stepwise GAMLSS
### Aliases: gamlss.scope
### Keywords: regression

### ** Examples

data(usair)
gs1<-gamlss.scope(model.frame(y~x1+x2+x3+x4+x5+x6, data=usair))
gs2<-gamlss.scope(model.frame(usair))
gs1
gs2
gs3<-gamlss.scope(model.frame(usair), smooth="fp", arg="3")
gs3 



