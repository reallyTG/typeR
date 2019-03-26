library(prospectr)


### Name: gapDer
### Title: Gap-Segment Derivative
### Aliases: gapDer

### ** Examples

data(NIRsoil)
spc <- 1/10^NIRsoil$spc # conversion to reflectance
opar <- par(no.readonly = TRUE)
par(mfrow=c(2,2),mar=c(4,4,2,2))
# plot of the 10 first spectra
matplot(as.numeric(colnames(spc)),t(spc[1:10,]),
        type='l',xlab='',ylab='Reflectance')
mtext('Raw spectra')
der <- gapDer(spc,m=1,w=1,s = 1,delta.wav=2)
matplot(as.numeric(colnames(der)),t(der[1:10,]),
        type='l',xlab='Wavelength /nm',ylab='gap derivative')
mtext('1st derivative spectra')
der <- gapDer(spc,m=1,w=11,s = 1,delta.wav=2)
matplot(as.numeric(colnames(der)),t(der[1:10,]),
        type='l',xlab='Wavelength /nm',ylab='gap derivative')
mtext('1st derivative spectra with a window size = 11 nm')
der <- gapDer(spc,m=1,w=11,s = 10,delta.wav=2)
matplot(as.numeric(colnames(der)),t(der[1:10,]),
        type='l',xlab='Wavelength /nm',ylab='gap derivative')
mtext('1st derivative spectra with a window size = 11 nm, smoothing of 10 nm')
par(opar)



