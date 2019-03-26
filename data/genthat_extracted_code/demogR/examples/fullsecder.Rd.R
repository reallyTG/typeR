library(demogR)


### Name: fullsecder
### Title: fullsecder
### Aliases: fullsecder
### Keywords: array algebra

### ** Examples


## eigenvalue second derivatives of the US projection matrix from 1967
data(goodman)
ult <- with(goodman, life.table(x=age, nKx=usa.nKx, nDx=usa.nDx))
mx <- goodman$usa.bx/goodman$usa.nKx
usa <- leslie.matrix(lx=ult$nLx,mx=mx)

fs <- fullsecder(usa)

## plot the survival cross-second derivatives of lambda with respect
## to infant survival

plot( seq(0,40,by=5), fs["21",10:18], type="l", 
	 xlab="Age (j)", 
	 ylab=expression(paste(partialdiff^2 , lambda, "/", 
	 partialdiff, P[1] , partialdiff, P[j])))
abline(h=0,lty=3)



