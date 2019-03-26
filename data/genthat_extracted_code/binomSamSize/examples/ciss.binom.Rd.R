library(binomSamSize)


### Name: ciss.binom
### Title: General purpose sample size calculation based on confidence
###   interval widths
### Aliases: ciss.binom
### Keywords: design survey

### ** Examples

#Compute the classical Wald-type interval using brute force search
#Note that nStart=2 needs to be called, because the Wald-intervals
#for x=round(1*0.5)=0 is too short.
ciss.binom(p0=1/2, d=0.1, alpha=0.05, method="asymptotic",nStart=2)
#This could of course be done easier
ciss.wald(p0=1/2, d=0.1, alpha=0.05)

#Same for the Wilson intervals
ciss.binom(p0=1/2, d=0.1, alpha=0.05, method="wilson")
ciss.wilson(p0=1/2, d=0.1, alpha=0.05)

#Now the mid-p intervals 
ciss.binom(p0=1/2, d=0.1, alpha=0.05, ci.fun=binom.midp)
#This search in Fosgate (2005) is a bit different, because interest
#is not directly in the length, but the length is used to derive
#the upper and lower limits and then a search is performed until
#the required alpha level is done. The difference is negliable
ciss.midp(p0=1/2, d=0.1, alpha=0.05)

#Another situation where no closed formula exists
ciss.binom(p0=1/2, d=0.1, alpha=0.05, method="lrt")

#Pooled samples. Now np02x is a func taking three arguments
#The k argument is provided as additional argument
np02x <- function(n,p0,k) round( (1-(1-p0)^k)*n )
ciss.binom( p0=0.1, d=0.05, alpha=0.05, ci.fun=poolbinom.lrt,
            np02x=np02x, k=10,verbose=TRUE)




