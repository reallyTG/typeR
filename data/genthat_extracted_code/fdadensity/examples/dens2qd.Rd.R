library(fdadensity)


### Name: dens2qd
### Title: Function for converting Densities to Quantile Densities
### Aliases: dens2qd

### ** Examples


x <- seq(0,2,length.out =512)
y <- rep(0.5,length.out =512)
y.qd <- dens2qd(dens=y, dSup = x) # should equate # 2




