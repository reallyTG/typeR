library(metRology)


### Name: .pmsd.xnorm
### Title: Internal functions for package RKC.
### Aliases: .pmsd.xnorm
### Keywords: internal

### ** Examples


## The function is currently defined as
function(q, x, n, sd=1, scale=FALSE) {

if(scale) sd <- sd/sqrt(2)

pxnorm<-function(q,x,sd=1) ifelse(q>0, pnorm(x+q, 0, sd)-pnorm(x-q, 0, sd), 0) 

Fy<-rep(0, length(q))

n.med<-floor(n/2) #exact for odd samples, low for even
#Note that for n values there are n-1 differences,
#so an even-n case is an odd-median case
ph<-pxnorm(q,x,sd)

for(j in n.med:(n-1)) Fy <- Fy + choose(n-1,j) * (ph^j) * (1-ph)^(n-j-1)

return(Fy)

  }



