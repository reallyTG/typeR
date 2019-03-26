library(prospectr)


### Name: honigs
### Title: Honigs algorithm for calibration sampling
### Aliases: honigs

### ** Examples

data(NIRsoil)
sel <- honigs(NIRsoil$spc,k=10,type='A')
wav <- as.numeric(colnames(NIRsoil$spc))
# spectral library
matplot(wav,t(NIRsoil$spc),type='l',xlab='wavelength /nm',ylab='Abs',col='grey50')
# plot calibration spectra
matlines(wav,t(NIRsoil$spc[sel$model,]),type='l',xlab='wavelength /nm',ylab='Abs',lwd=2,lty=1)
# add bands used during the selection process
abline(v=wav[sel$bands])



