library(sads)


### Name: dgs
### Title: Geometric series distribution
### Aliases: dgs pgs qgs rgs

### ** Examples

x <- 1:25
PDF <- dgs(x=x, k=0.1, S=25)
CDF <- pgs(q=x, k=0.1, S=25)
par(mfrow=c(1,2))
plot(x,CDF, ylab="Cumulative Probability", type="b",
     main="Geometric series distribution, CDF")
plot(x,PDF, ylab="Probability, log-scale", type="h",
     main="Geometric series distribution, PDF", log="y")
par(mfrow=c(1,1))

## quantile is the inverse of CDF
all.equal(qgs(CDF, k=0.1, S=25), x)



