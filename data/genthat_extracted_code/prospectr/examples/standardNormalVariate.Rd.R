library(prospectr)


### Name: standardNormalVariate
### Title: Standard normal variate transformation
### Aliases: standardNormalVariate

### ** Examples

data(NIRsoil)
spc <- 1/10^NIRsoil$spc # conversion to reflectance
snv <- standardNormalVariate(X = spc)
# 10 first snv spectra
matplot(as.numeric(colnames(snv)),t(snv[1:10,]),type='l',xlab='wavelength /nm',ylab='snv')
## Not run: 
##D apply(snv,1,sd) # check
## End(Not run)



