library(sads)


### Name: dmand
### Title: Zipf-Mandelbrodt distribution
### Aliases: dmand pmand qmand rmand

### ** Examples

x <- 1:100
PDF <- dmand(x=x, N=100, s=1.5, v=2)
CDF <- pmand(q=x, N=100, s=1.5, v=2)
par(mfrow=c(1,2))
plot(x,CDF, ylab="Cumulative Probability", type="b",
     main="Zipf-Mandelbrodt distribution, CDF")
plot(x,PDF, ylab="Probability", type="h",
     main="Zipf-Mandelbrodt distribution, PDF")
par(mfrow=c(1,1))

## quantile is the inverse of CDF
all.equal( qmand(p=CDF, N=100, s=1.5, v=2), x)

## Zipf distribution is a particular case of ZM when v=0
all.equal( dmand(x=x, N=100, s=1.5, v=0), dzipf(x=x, N=100, s=1.5) )




