library(sads)


### Name: dbs
### Title: MacArthur's Broken-stick distribution
### Aliases: dbs pbs qbs drbs prbs qrbs rrbs rbs

### ** Examples

x <- 1:25
PDF <- drbs(x=x, N=100, S=25)
CDF <- prbs(q=x, N=100, S=25)
par(mfrow=c(1,2))
plot(x,CDF, ylab="Cumulative Probability", type="b",
     main="Broken-stick rank distribution, CDF")
plot(x,PDF, ylab="Probability", type="h",
     main="Broken-stick rank distribution, PDF")
par(mfrow=c(1,1))

## quantile is the inverse of CDF
all.equal( qrbs( CDF, N=100, S=25), x) # should be TRUE



