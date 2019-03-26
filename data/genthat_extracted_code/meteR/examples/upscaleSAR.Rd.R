library(meteR)


### Name: upscaleSAR
### Title: upscale SAR
### Aliases: upscaleSAR

### ** Examples

data(anbo)
anbo.sar <- meteSAR(anbo$spp, anbo$count, anbo$row, anbo$col, Amin=1, A0=16)
anbo.sar
plot(anbo.sar, xlim=c(1, 2^10), ylim=c(3, 50), log='xy')

## get upscaled SAR and add to plot
anbo.esf <- meteESF(spp=anbo$spp, abund=anbo$count) # need ESF for upscaling
anbo.sarUP <- upscaleSAR(anbo.esf, 16, 2^10)
plot(anbo.sarUP, add=TRUE, col='blue')



