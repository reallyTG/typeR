library(sads)


### Name: dls
### Title: Fisher's Log-series distribution
### Aliases: dls pls qls rls

### ** Examples

x <- 1:100
PDF <- dls(x=x, N=100, alpha=5)
CDF <- pls(q=x, N=100, alpha=5)
par(mfrow=c(1,2))
plot(x,CDF, ylab="Cumulative Probability", type="b",
     main="Log-Series distribution, CDF")
plot(x,PDF, ylab="Probability", type="h",
     main="Log-Series distribution, PDF")
par(mfrow=c(1,1))

## Fisher log-series is a discrete PDF, hence:
all.equal(pls(10,N=1000,alpha=50), sum(dls(1:10,N=1000,alpha=50))) # should be TRUE

## qls is the inverse of pls
all.equal(qls(CDF,N=100,alpha=5), x) # should be TRUE



