library(meteR)


### Name: empiricalSAR
### Title: Empirical SAR or EAR
### Aliases: empiricalSAR

### ** Examples

data(anbo)
anbo.obs.sar <- empiricalSAR(anbo$spp, anbo$count, anbo$row, anbo$col, Amin=1, A0=16)
plot(anbo.obs.sar)
anbo.obs.ear <- empiricalSAR(anbo$spp, anbo$count, anbo$row, anbo$col, Amin=1, A0=16, EAR=TRUE)
plot(anbo.obs.ear)

## empirical SAR from simulated x, y data
anbo$x <- runif(nrow(anbo), 0, 1) + anbo$column
anbo$y <- runif(nrow(anbo), 0, 1) + anbo$row
meteSAR(anbo$spp, anbo$count, x=anbo$x, y=anbo$y, row=4, col=4)



