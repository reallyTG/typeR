library(VdgRsm)


### Name: fds.sphere
### Title: The Fraction of Design Space (FDS) plots for spherical-region
###   designs
### Aliases: fds.sphere

### ** Examples

CCD1<- gen.CCD(n.vars = 2, n.center = 2, alpha = 1)
CCD2<- gen.CCD(n.vars = 2, n.center = 2, alpha = sqrt(2))
fds.sphere(CCD1, CCD2)



