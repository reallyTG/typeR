library(RSEIS)


### Name: applytaper
### Title: Apply taper to seismic trace
### Aliases: applytaper
### Keywords: misc

### ** Examples

data(CE1)
Xamp  <-  CE1$y[CE1$x>5.443754 & CE1$x<5.615951]
Tamp  <-  applytaper(Xamp, p = 0.05)



