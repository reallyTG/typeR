library(prospectr)


### Name: detrend
### Title: Detrend transformation
### Aliases: detrend

### ** Examples

data(NIRsoil)
wav <- as.numeric(colnames(NIRsoil$spc))
spc <- 1/10^NIRsoil$spc # conversion to reflectance
opar <- par(no.readonly = TRUE)
par(mfrow=c(2,1),mar=c(4,4,2,2))
matplot(wav,t(spc[1:10,]),type='l',xlab='',ylab='Reflectance') # plot of the 10 first spectra
mtext('Raw spectra')
det <- detrend(spc,wav)
matplot(wav,t(det[1:10,]),type='l',xlab='Wavelength /nm',ylab='Reflectance')
mtext('Detrend spectra')
par(opar)



