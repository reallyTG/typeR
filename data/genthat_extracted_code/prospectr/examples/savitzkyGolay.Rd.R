library(prospectr)


### Name: savitzkyGolay
### Title: Savitzky-Golay transformation
### Aliases: savitzkyGolay

### ** Examples

data(NIRsoil)
spc <- 1/10^NIRsoil$spc # conversion to reflectance
opar <- par(no.readonly = TRUE)
par(mfrow=c(2,1),mar=c(4,4,2,2))
# plot of the 10 first spectra
matplot(as.numeric(colnames(spc)),t(spc[1:10,]),type='l',xlab='',ylab='Reflectance')
mtext('Raw spectra')
sg <- savitzkyGolay(X = spc,1,3,11,delta.wav=2)
matplot(as.numeric(colnames(sg)),t(sg[1:10,]),type='l',xlab='Wavelength /nm',ylab='1st derivative')
mtext('1st derivative spectra')
par(opar)



