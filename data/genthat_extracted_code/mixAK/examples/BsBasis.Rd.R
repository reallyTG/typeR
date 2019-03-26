library(mixAK)


### Name: BsBasis
### Title: B-spline basis
### Aliases: BsBasis
### Keywords: smooth dplot

### ** Examples

set.seed(20101126)
t <- runif(20, 0, 100)

oldPar <- par(mfrow=c(1, 2), bty="n")
Bs <- BsBasis(degree=3, ninner=3, knotsBound=c(0, 100), intercept=FALSE,
              x=t, tgrid=0:100, plot=TRUE)
print(Bs)

Bs2 <- BsBasis(degree=3, ninner=3, knotsBound=c(0, 100), intercept=TRUE,
               x=t, tgrid=0:100, plot=TRUE)
print(Bs2)
par(oldPar)

print(Bs)
print(Bs2)



