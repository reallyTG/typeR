library(spectacles)


### Name: fill_spectra
### Title: Fill missing wavelengths of a Spectra* object with a given value
### Aliases: fill_spectra fill_spectra,Spectra-method

### ** Examples


# Loading example data
data(australia)
spectra(australia) <- sr_no ~ ... ~ 350:2500

# Cut wavelengths out of the collection
oz <- cut(australia, wl=-1*c(355:400, 2480:2499))
big.head(spectra(oz), , 7)

# Giving the wavelengths at which I want data
oz_filled <- fill_spectra(oz, ref = 350:2500, fill = NA)
big.head(spectra(oz_filled), , 7)
plot(oz_filled)

# Trying to guess ref values
oz_filled <- fill_spectra(oz, fill = -999)
big.head(spectra(oz_filled), , 7)
plot(oz_filled)




