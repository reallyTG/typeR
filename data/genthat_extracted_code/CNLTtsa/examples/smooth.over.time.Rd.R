library(CNLTtsa)


### Name: smooth.over.time
### Title: Function to perform smoothing over time of spectral quantities
### Aliases: smooth.over.time
### Keywords: methods

### ** Examples


x<-sort(runif(100))

y <-sin(2*pi*(1/25)*x) + sin(2*pi*(1/50)*x)

## Not run: 
##D xy.dec<-cnlt.univ(x,y,P=300)
##D 
##D # compute the real part of the spectrum (real details^2) and smooth over scale, then over time
##D ReS <- smooth.over.scale(x, sapply(xy.dec$det1,Re), sapply(xy.dec$det1,Re), xy.dec$lre, 
##D xy.dec$lreA, positive = TRUE)
##D 
##D ReS.smooth <- smooth.over.time(x,ReS$spec,5,1.05)
## End(Not run)




