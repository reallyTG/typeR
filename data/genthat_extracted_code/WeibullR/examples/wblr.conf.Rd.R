library(WeibullR)


### Name: wblr.conf
### Title: Add Confidence Interval Bounds to 'wblr' Objects
### Aliases: wblr.conf

### ** Examples

## full dataset ##
da1 <- wblr(runif(10,100,1e4),label="Complete data")
da1 <- wblr.fit(da1)
da1 <- wblr.conf(da1,method.conf="pivotal-rr",col="red")
da1 <- wblr.conf(da1,method.conf="bbb",col="orange")
da1 <- wblr.fit(da1, method.fit="mle")
da1 <- wblr.conf(da1,method.conf="lrb",col="yellow3")

## plot datasets ##
## Not run: 
##D plot(da1,main="Comparison between different bound types.")
## End(Not run)

## with right-censored data
da2 <- runif(8,100,1e4)
da2 <- wblr(fail=da2,susp=rep(max(da2),2),label="Type II right-censored data")
da2 <- wblr.fit(da2)
da2 <- wblr.conf(da2,method.conf="pivotal-rr",col="blue1")
da2 <- wblr.conf(da2,method.conf="bbb",col="steelblue")
da2 <- wblr.fit(da2, method.fit="mle")
da2 <- wblr.conf(da2,method.conf="lrb",col="cyan3")
## Not run: 
##D plot(da2,main="Comparison between different bound types with right-censored data.")
## End(Not run)



