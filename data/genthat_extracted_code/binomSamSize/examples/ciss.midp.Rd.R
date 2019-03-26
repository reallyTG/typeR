library(binomSamSize)


### Name: ciss.midp
### Title: Sample size calculations using the Fosgate (2005) approach
### Aliases: ciss.midp
### Keywords: design survey

### ** Examples

#Fosgate approach
ciss.midp(p0=0.2,alpha=0.05,d=0.05)
#Iterative increase of n using the general purpose function
ciss.binom( p0=0.2, alpha=0.05, ci.fun=binom.midp, d=0.05)




