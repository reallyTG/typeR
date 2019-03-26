library(meteR)


### Name: plot.sar
### Title: Plot the species abundance distribution (SAR), i.e. objects of
###   class sar
### Aliases: plot.sar

### ** Examples

data(anbo)
anbo.obs.sar <- empiricalSAR(anbo$spp, anbo$count, anbo$row, anbo$col, Amin=1, A0=16)
plot(anbo.obs.sar)



