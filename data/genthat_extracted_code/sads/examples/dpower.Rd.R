library(sads)


### Name: dpower
### Title: Power discrete distribution
### Aliases: dpower ppower qpower rpower

### ** Examples

x <- 1:20
PDF <- dpower(x=x, s=2)
CDF <- ppower(q=x, s=2)
par(mfrow=c(1,2))
plot(x,CDF, ylab="Cumulative Probability", type="b",
     main="Power distribution, CDF")
plot(x,PDF, ylab="Probability", type="h",
     main="Power distribution, PDF")
par(mfrow=c(1,1))

## The power distribution is a discrete PDF, hence:
all.equal( ppower(10, s=2), sum(dpower(1:10, s=2)) ) # should be TRUE

## quantile is the inverse of CDF
all.equal(qpower(CDF, s=2), x) 




