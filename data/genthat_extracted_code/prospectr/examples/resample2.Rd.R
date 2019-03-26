library(prospectr)


### Name: resample2
### Title: Resample a high resolution signal to a low resolution signal
###   using full width half maximum (FWHM) values
### Aliases: resample2

### ** Examples

data(NIRsoil)
wav <- as.numeric(colnames(NIRsoil$spc))
spc <- 1/10^NIRsoil$spc # conversion to reflectance
# Plot 10 first spectra
matplot(wav,t(spc[1:10,]),type='l',xlab='Wavelength /nm',ylab='Reflectance')
# ASTER SWIR bands (nm)
new.wav <- c(1650,2165,2205,2260,2330,2395) # positions
fwhm <- c(100,40,40,50,70,70) #  fwhm's
# Resample NIRsoil to ASTER band positions
aster <- resample2(spc,wav,new.wav,fwhm)
matpoints(as.numeric(colnames(aster)),t(aster[1:10,]),pch=1:5)



