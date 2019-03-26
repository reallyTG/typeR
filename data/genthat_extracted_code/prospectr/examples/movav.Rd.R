library(prospectr)


### Name: movav
### Title: Moving average
### Aliases: movav

### ** Examples

data(NIRsoil)
wav <- as.numeric(colnames(NIRsoil$spc))
spc <- 1/10^NIRsoil$spc # conversion to reflectance
spc <- spc + rnorm(length(spc),0,0.001) # adding some noise
matplot(wav,t(spc[1:10,]),type='l',xlab='Wavelength /nm',ylab='Reflectance')
mov <- movav(spc,w=11) # window size of 11 bands
matlines(as.numeric(colnames(mov)),t(mov[1:10,])) # smoothed data



