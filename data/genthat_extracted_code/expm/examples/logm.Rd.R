library(expm)


### Name: logm
### Title: Matrix Logarithm
### Aliases: logm
### Keywords: algebra math

### ** Examples

m <- diag(2)
logm(m)
expm(logm(m))

## Here, logm() is barely defined, and Higham08 has needed an amendment
## in order for not to loop forever:
D0 <- diag(x=c(1, 0.))
(L. <- logm(D0))
stopifnot( all.equal(D0, expm(L.)) )

## A matrix for which clearly no logm(.) exists:
(m <- cbind(1:2, 1))
(l.m <- try(logm(m))) ## all NA or even error {on Solaris}
## Don't show: 
 if(!inherits(l.m, "try-error")) stopifnot(is.na(l.m))
## End(Don't show)
## The "Eigen" method  ``works''  but wrongly :
expm(logm(m, "Eigen"))



