library(sads)


### Name: dzipf
### Title: Zipf distribution
### Aliases: dzipf pzipf qzipf rzipf

### ** Examples

x <- 1:20
PDF <- dzipf(x=x, N=100, s=2)
CDF <- pzipf(q=x, N=100, s=2)
par(mfrow=c(1,2))
plot(x,CDF, ylab="Cumulative Probability", type="b",
     main="Zipf distribution, CDF")
plot(x,PDF, ylab="Probability", type="h",
     main="Zipf distribution, PDF")
par(mfrow=c(1,1))

## quantile is the inverse of CDF
all.equal( qzipf(CDF, N=100, s=2), x) # should be TRUE

## Zipf distribution is discrete hence
all.equal( sum(dzipf(1:10, N=10, s=2)), pzipf(10, N=10, s=2)) # should be TRUE



