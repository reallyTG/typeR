library(freestats)


### Name: classify.ab
### Title: Classify for adaboost result
### Aliases: classify.ab

### ** Examples

set.seed(1024)
z <- runif(n=5)
mydata <- fakedata(w=z,n=100)
X<- mydata$S[,1:4]
y <- mydata$y
res <- adaBoost(dat.train=X,y.train=y,B=3)
classify.ab(res,X)



