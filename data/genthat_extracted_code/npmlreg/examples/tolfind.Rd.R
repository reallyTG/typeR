library(npmlreg)


### Name: tolfind
### Title: Grid search over tol for NPML estimation of (generalized) random
###   effect models
### Aliases: tolfind
### Keywords: models regression

### ** Examples

  data(galaxies, package="MASS")
  gal<-as.data.frame(galaxies)
  tolfind(galaxies/1000~1, random=~1, k=5, data=gal, lambda=1, damp=TRUE, 
      find.in.range=c(0,1), steps=10) 
  # Minimal Disparity: 380.1444 at tol= 0.5 
 


