library(fdadensity)


### Name: dens2quantile
### Title: Function for converting Densities to Quantile Functions
### Aliases: dens2quantile

### ** Examples


x <- seq(0,2,length.out =512)
y <- rep(0.5,length.out =512)
y.quantile <- dens2quantile(dens=y, dSup = x) # should equate # 2*seq(0, 1, length.out = 512)




