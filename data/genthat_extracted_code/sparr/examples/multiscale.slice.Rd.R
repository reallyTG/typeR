library(sparr)


### Name: multiscale.slice
### Title: Slicing a multi-scale density/intensity object
### Aliases: multiscale.slice

### ** Examples

## No test: 
data(chorley) # Chorley-Ribble data (package 'spatstat')
ch.multi <- multiscale.density(chorley,h0=1,h0fac=c(0.5,2))

available.h0(ch.multi)
ch.slices <- multiscale.slice(ch.multi,h0=c(0.7,1.1,1.6))

par(mfcol=c(2,3)) # plot each density and edge-correction surface
for(i in 1:3) { plot(ch.slices[[i]]$z); plot(ch.slices[[i]]$q) }
## End(No test)




