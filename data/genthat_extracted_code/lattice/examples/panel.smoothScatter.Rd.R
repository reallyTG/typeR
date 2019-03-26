library(lattice)


### Name: F_2_panel.smoothScatter
### Title: Lattice panel function analogous to smoothScatter
### Aliases: panel.smoothScatter
### Keywords: hplot

### ** Examples


ddf <- as.data.frame(matrix(rnorm(40000), ncol = 4) + 3 * rnorm(10000))
ddf[, c(2,4)] <- (-ddf[, c(2,4)])
xyplot(V1 ~ V2 + V3, ddf, outer = TRUE,
       panel = panel.smoothScatter, aspect = "iso")
splom(ddf, panel = panel.smoothScatter, nbin = 64, raster = TRUE)




