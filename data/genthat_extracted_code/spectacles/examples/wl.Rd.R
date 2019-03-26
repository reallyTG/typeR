library(spectacles)


### Name: wl
### Title: Retrieves or sets the wavelengths of a 'Spectra*' object.
### Aliases: wl wl<- wl,Spectra-method wl<-,Spectra-method
###   wl<-,data.frame-method wl<-,data.frame-method wl<-,Spectra-method

### ** Examples


# Loading example data
data(oz)
spectra(oz) <- sr_no ~ ... ~ 350:2500

# Retrieving wavelengths from Spectra* object
wl(oz)

# Replacing wavelength values - USE WITH CAUTION!
wl(oz) <- 1:length(oz)
wl(oz)

# Use to initiate a Spectra* object from a data.frame
data(oz)
wl(oz) <- 350:2500
ids(oz) <- ~ sr_no




