library(sensR)


### Name: AUC
### Title: AUC computation
### Aliases: AUC.default AUC.anota print.AUC AUC
### Keywords: htest

### ** Examples


## Compute AUC from d-prime and confindence interval for the AUC:
fm1 <- AnotA(8, 25, 1, 25)
AUC(d=fm1$coef, se.d=fm1$se)
## The AUC-method for AnotA-objects can be used for convenience:
AUC(fm1)

## Don't show: 
## Test agreement of AUC computations:
x <- AUC(fm1$coef, fm1$se)
y <- AUC(fm1)
z <- pnorm(fm1$coef/sqrt(2))
## w := dput(as.vector(z))
w <- 0.817851857437929

stopifnot(
  isTRUE(all.equal(as.vector(x$value), as.vector(y$value),
                   as.vector(z), w)),
  isTRUE(all.equal(x$lower, y$lower)),
  isTRUE(all.equal(x$upper, y$upper))
)

## Don't actually know what this is supposed to illustrate:
(odor <- matrix(c(112, 112, 72, 53, 22, 4, 7, 38, 50, 117, 101, 62), 2,
               byrow = TRUE))
(d.primes <- SDT(odor)[,3])
for(i in 1:5) print(AUC(d.primes[i]))
## End(Don't show)




