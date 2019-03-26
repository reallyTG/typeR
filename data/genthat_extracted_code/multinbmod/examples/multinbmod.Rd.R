library(multinbmod)


### Name: multinbmod
### Title: Regression analysis of overdispersed correlated count data
### Aliases: multinbmod
### Keywords: count data multivariate negative binomial Clustered

### ** Examples

id <- factor(rep(1:20, rep(5, 20)))
y <- rnbinom(100, mu = rexp(100,1)+rep(rexp(20,.3),rep(5,20)),size=2.5)
x<-rbinom(100,1,.5)
dat <- data.frame(y = y, x = x, id = id)
multinbmod(y~x,data=dat,id=id)
summary(multinbmod(y~x,data=dat,id=id,control=list(iter.max=100)))



