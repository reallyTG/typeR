library(spectacles)


### Name: wl_units
### Title: Wavelengths of Spectra* objects
### Aliases: wl_units wl_units<- wl_units,Spectra-method
###   wl_units<-,Spectra-method wl_units<-,Spectra-method

### ** Examples

# Loading example data
data(oz)
spectra(oz) <- sr_no ~ ... ~ 350:2500

# Print wavelength information
wl(oz)
range(wl(oz))

# Manipulate wavelength information
wl(oz) <- wl(oz) + 1000
wl(oz)




