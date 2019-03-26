library(RFOC)


### Name: polyfoc
### Title: Polt the focal mechanism polygon
### Aliases: polyfoc
### Keywords: aplot

### ** Examples

MEC = SDRfoc(13,59,125, PLOT=FALSE)

net()
ply = polyfoc(MEC$az1, MEC$dip1, MEC$az2, MEC$dip2, PLOT = TRUE, UP = TRUE)




