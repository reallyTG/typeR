library(spectacles)


### Name: separate
### Title: Separates a 'Spectra*' object into a calibration and a
###   validation set.
### Aliases: separate separate.Spectra separate,Spectra-method

### ** Examples


# Loading example data
data(australia)
spectra(australia) <- sr_no ~ ... ~ 350:2500

l <- separate(australia, calibration=0.7)
# The result is a list of two Spectra* objects
str(l)
lapply(l, nrow)



