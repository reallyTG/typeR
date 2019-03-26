library(geoSpectral)


### Name: spc.plot.overlay
### Title: Plotting multiple 'Spectra' objects inside a 'SpcList'
### Aliases: spc.plot.overlay spc.plot.overlay,SpcList-method

### ** Examples

sp <- spc.example_spectra()
BL = spc.makeSpcList(sp,"CAST")
spc.plot.overlay(BL)
spc.plot.overlay(BL, xlim=c(400,500),ylim=c(0,0.2),lwd=2)
spc.plot.overlay(BL, col=c("red"), leg_idx=FALSE, lty=2)
spc.plot.overlay(BL, col=c("red","blue","green","yellow","cyan","black"))




