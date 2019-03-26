library(fdadensity)


### Name: qd2dens
### Title: Function for converting Quantile Densities to Densities
### Aliases: qd2dens

### ** Examples


x <- seq(0,1,length.out =512)
y <- rep(2,length.out =512)
y.dens <- qd2dens(qd=y, qdSup = x, dSup = seq(0, 2, length.out = 512)) # should equate # 1/2




