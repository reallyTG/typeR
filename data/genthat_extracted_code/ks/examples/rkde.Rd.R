library(ks)


### Name: rkde
### Title: Derived quantities from kernel density estimates
### Aliases: dkde pkde qkde rkde
### Keywords: smooth

### ** Examples

set.seed(8192)
x <- rnorm.mixt(n=10000, mus=0, sigmas=1, props=1)
fhat <- kde(x=x, binned=TRUE)
p1 <- pkde(fhat=fhat, q=c(-1, 0, 0.5))
qkde(fhat=fhat, p=p1)    
y <- rkde(fhat=fhat, n=100)

x <- rmvnorm.mixt(n=10000, mus=c(0,0), Sigmas=invvech(c(1,0.8,1)))
fhat <- kde(x=x, binned=TRUE)
y <- rkde(fhat=fhat, n=1000)
fhaty <- kde(x=y, binned=TRUE)
plot(fhat)
plot(fhaty, add=TRUE, col=2)



