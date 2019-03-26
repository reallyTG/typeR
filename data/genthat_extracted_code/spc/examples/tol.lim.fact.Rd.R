library(spc)


### Name: tol.lim.fac
### Title: Two-sided tolerance limit factors
### Aliases: tol.lim.fac
### Keywords: ts

### ** Examples

n <- 2:10
p <- .95
a <- .05
kWW <- sapply(n,p=p,a=a,tol.lim.fac)
kEX <- sapply(n,p=p,a=a,mode="exact",tol.lim.fac)
print(cbind(n,kWW,kEX),digits=4)
## Odeh/Owen (1980), page 98, in Table 3.4.1
##  n  factor k
##  2  36.519
##  3   9.789
##  4   6.341
##  5   5.077
##  6   4.422
##  7   4.020
##  8   3.746
##  9   3.546
## 10   3.393

## n -> infty
n <- 10^{1:7}
p <- .95
a <- .05
kEX <- round(sapply(n,p=p,a=a,mode="exact",tol.lim.fac),digits=4)
kEXinf <- round(qnorm(1-a/2),digits=4)
print(rbind(cbind(n,kEX),c("infinity",kEXinf)),quote=FALSE)



