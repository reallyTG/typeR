library(meteR)


### Name: plot.meteRelat
### Title: Plot predicted METE relationships and associated observed
###   relationship seen in data
### Aliases: plot.meteRelat

### ** Examples

data(anbo)
anbo.sar <- meteSAR(anbo$spp, anbo$count, anbo$row, anbo$col, Amin=1, A0=16)
plot(anbo.sar)



