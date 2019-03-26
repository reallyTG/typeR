library(meteR)


### Name: ssad
### Title: Species Spatial Abundance Distribution
### Aliases: ssad ssad.meteSSF

### ** Examples

data(anbo)
pi1 <- meteSSF(anbo$spp, 'crcr', anbo$count, row=anbo$row, col=anbo$col, A=1, A0=16)
plot(ssad(pi1))



