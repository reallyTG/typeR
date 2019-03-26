library(FAmle)


### Name: plot.metropolis
### Title: A Function to Plot metropolis objects
### Aliases: plot.metropolis
### Keywords: aplot models

### ** Examples

data(yarns)
x <- yarns$x
fit.x <- mle(x,'gamma',c(.1,.1))
bayes.x <- metropolis(model=fit.x,iter=100,
	trans.list=list(function(x) exp(x),function(x) exp(x)))
plot(bayes.x)
plot(bayes.x,'hist',col='cyan')
plot(bayes.x,'pairs',cex=.1,pch=19)
plot(bayes.x,'pairs',pos=sample(1:bayes.x$iter,20),col='red')
plot(bayes.x,'post.pred',col='green')



