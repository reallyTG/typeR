library(prospectr)


### Name: continuumRemoval
### Title: Continuum Removal
### Aliases: continuumRemoval

### ** Examples

data(NIRsoil)
wav <- as.numeric(colnames(NIRsoil$spc))
# plot of the 10 first abs spectra
matplot(wav,t(NIRsoil$spc[1:10,]),type='l',ylim=c(0,.6),xlab='Wavelength /nm',ylab='Abs')
# type = 'A' is used for absorbance spectra
cr <- continuumRemoval(NIRsoil$spc,wav,type='A')
matlines(wav,t(cr[1:10,]))



