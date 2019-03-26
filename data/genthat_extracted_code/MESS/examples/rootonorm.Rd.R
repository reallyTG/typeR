library(MESS)


### Name: rootonorm
### Title: Hanging rootogram for normal distribution
### Aliases: rootonorm rootogram
### Keywords: hplot

### ** Examples


oldpar <- par()
par(mfrow=c(2,2))
rootonorm(rnorm(200))
rootonorm(rnorm(200), type="deviation", scale="raw")
rootonorm(rnorm(200), mu=1)
rootonorm(rexp(200), mu=1)
par(oldpar)




