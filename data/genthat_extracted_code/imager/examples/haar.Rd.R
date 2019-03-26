library(imager)


### Name: haar
### Title: Compute Haar multiscale wavelet transform.
### Aliases: haar

### ** Examples

#Image compression: set small Haar coefficients to 0
hr <- haar(boats,nb=3) 
mask.low <- threshold(abs(hr),"75%")
mask.high <- threshold(abs(hr),"95%")
haar(hr*mask.low,inverse=TRUE,nb=3) %>% plot(main="75% compression")
haar(hr*mask.high,inverse=TRUE,nb=3) %>% plot(main="95% compression")



