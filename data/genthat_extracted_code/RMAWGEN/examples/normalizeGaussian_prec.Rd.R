library(RMAWGEN)


### Name: normalizeGaussian_prec
### Title: Converts precipitation values to "Gaussinized"
###   normally-distributed values taking into account the probability of no
###   precipitation occurences. values or vice versa in case 'inverse' is
###   'TRUE'
### Aliases: normalizeGaussian_prec

### ** Examples

library(RMAWGEN)
NDATA <- 1000
occurence <- as.logical(runif(NDATA)>0.5)
prec <- rexp(NDATA,rate=1/3)
prec[!occurence] <- 0
valmin <- 0.5 #0.01
x <- normalizeGaussian_prec(x=prec,valmin=valmin)
prec2 <- normalizeGaussian_prec(x=x,data=prec,valmin=valmin,inverse=TRUE)
qqplot(prec,prec2)

occurence3 <- as.logical(runif(NDATA)>0.5)
prec3 <- rexp(NDATA,rate=1/3)
prec3[!occurence3] <- 0
x3 <- normalizeGaussian_prec(x=prec3,valmin=valmin) 

qqplot(x,x3)
abline(0,1)





