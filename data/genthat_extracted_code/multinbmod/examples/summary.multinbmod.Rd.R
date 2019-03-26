library(multinbmod)


### Name: summary.multinbmod
### Title: Summary of a multinbmod object
### Aliases: summary.multinbmod summary

### ** Examples

id <- factor(rep(1:20, rep(5, 20)))
y <- rnbinom(100, mu = rexp(100,1)+rep(rexp(20,.3),rep(5,20)),size=2.5)
x<-rbinom(100,1,.5)
dat <- data.frame(y = y, x = x, id = id)
summary(myfit<-multinbmod(y~x,data=dat,id=id,control=list(iter.max=100)))



