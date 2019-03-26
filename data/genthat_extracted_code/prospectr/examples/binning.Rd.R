library(prospectr)


### Name: binning
### Title: Signal binning
### Aliases: binning

### ** Examples

data(NIRsoil)
spc <- 1/10^NIRsoil$spc # conversion to reflectance
wav <- as.numeric(colnames(spc))
matplot(wav,t(spc[1:5,]),type='l',xlab='Wavelength /nm',ylab='Reflectance') # 5 first spectra
binned <- binning(spc,bin.size=20)
matpoints(as.numeric(colnames(binned)),t(binned[1:5,]),pch=1:5) # bin means
binned <- binning(spc,bins=20)
dim(binned) # 20 bins
matplot(wav,t(spc[1:5,]),type='l',xlab='Wavelength /nm',ylab='Reflectance') # 5 first spectra
matpoints(as.numeric(colnames(binned)),t(binned[1:5,]),pch=1:5) # bin means



