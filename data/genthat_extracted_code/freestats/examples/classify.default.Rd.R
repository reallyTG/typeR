library(freestats)


### Name: classify.default
### Title: Default method for classify
### Aliases: classify.default

### ** Examples

set.seed(1024)
z <- runif(n=5)
mydata <- fakedata(w=z,n=100)
X<- mydata$S[,1:4]
y <- mydata$y
w <- rep(1/100,100)
pars <- decisionStump(X=X,w=w,y=y)
classify.default(pars,X)



