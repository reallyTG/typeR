library(qtlhot)


### Name: highlod
### Title: Pull high LOD values with chr and pos.
### Aliases: highlod print.highlod summary.highlod plot.highlod max.highlod
###   quantile.highlod pull.highlod
### Keywords: utilities

### ** Examples

example(include.hotspots)
scan1 <- scanone(cross1, pheno.col = 1:1000, method = "hk")
high1 <- highlod(scan1, lod.thr = 2.11, drop.lod = 1.5)
pull.highlod(high1, chr = 2, pos = 24)
summary(high1, lod.thr = 2.44)
max(high1, lod.thr = seq(2.11, 3.11, by = .1))



