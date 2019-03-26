library(demogR)


### Name: secder
### Title: secder
### Aliases: secder
### Keywords: array algebra

### ** Examples


## eigenvalue second derivatives of the US projection matrix from 1967
## with respect to infant survival
data(goodman)
ult <- with(goodman, life.table(x=age, nKx=usa.nKx, nDx=usa.nDx))
mx <- goodman$usa.bx/goodman$usa.nKx
usa <- leslie.matrix(lx=ult$nLx,mx=mx)

sd21 <- secder(usa,2,1)



