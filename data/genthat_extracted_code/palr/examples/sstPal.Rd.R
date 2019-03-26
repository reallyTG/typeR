library(palr)


### Name: sstPal
### Title: SST colours
### Aliases: sstPal

### ** Examples

library(raster)
data(oisst)
sstcols <- sstPal(palette = TRUE)
plot(oisst, col = sstcols$col, zlim = range(sstcols$breaks))



