library(binomSamSize)


### Name: ciss.pool.wald
### Title: Sample size calculations for fixed pool size and perfect test
### Aliases: ciss.pool.wald
### Keywords: design survey

### ** Examples

k <- 1:50
n <- sapply(k, function(k) ciss.pool.wald(pi0=0.1, alpha=0.05,k=k, d=0.05))
#sizes <- cbind(k=k, n=n, N=n*k)
plot(k, n, type="s",xlab="Pool size",ylab="Number of pools")
plot(k*n,n,type="s",xlab="Total size",ylab="Number of pools")

ciss.pool.wald(pi0=0.1, d=0.01, alpha=0.05, k=10)
#Compare with ciss.binom function
np02x <- function(n,p0,k) round( (1-(1-p0)^k)*n )
(n <- ciss.binom( p0=0.1, d=0.01, alpha=0.05, ci.fun=poolbinom.wald,
            np02x=np02x, k=10))




