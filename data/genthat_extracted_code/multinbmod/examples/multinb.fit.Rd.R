library(multinbmod)


### Name: multinb.fit
### Title: Multivariate negative binomial model with robust estimation of
###   regression coefficients
### Aliases: multinb.fit

### ** Examples

id <- factor(rep(1:20, rep(5, 20)))
y <- rnbinom(100, mu = rexp(100,1)+rep(rexp(20,.3),rep(5,20)),size=2.5)
x<-rbinom(100,1,.5)
dat <- data.frame(y = y, x = x, id = id)
multinb.fit(y,cbind(1,x),id=id)



