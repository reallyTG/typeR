library(sads)


### Name: dpowbend
### Title: Puyeo's Power-bend discrete distribution
### Aliases: dpowbend ppowbend qpowbend rpowbend

### ** Examples

x <- 1:20
PDF <- dpowbend(x=x, s=2.1, omega=0.5)
CDF <- ppowbend(q=x, s=2.1, omega=0.5)
par(mfrow=c(1,2))
plot(x,CDF, ylab="Cumulative Probability", type="b",
     main="Powerbend distribution, CDF")
plot(x,PDF, ylab="Probability", type="h",
     main="Powerbend distribution, PDF")
par(mfrow=c(1,1))

## The powbend distribution is a discrete PDF, hence:
all.equal( ppowbend(10, s=2.1, omega=0.5), sum(dpowbend(1:10, s=2.1, omega=0.5)) ) # should be TRUE

## quantile is the inverse of CDF
all.equal(qpowbend(CDF, s=2.1, omega=0.5), x)

## Equivalence between power-bend and logseries
x <- 1:100
N <- 1000
alpha <- 5
X <- N/(N+alpha)
omega <- -log(X)
PDF1 <- dls(x, N, alpha)
PDF2 <- dpowbend(x, s=1, omega)
plot(PDF1,PDF2, log="xy")
abline(0,1, col="blue")



