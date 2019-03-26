library(spectacles)


### Name: rbind
### Title: Stacking 'Spectra' objects together
### Aliases: rbind rbind.Spectra rbind.SpectraDataFrame rbind
###   rbind.SpectraDataFrame

### ** Examples


# Loading example data
data(australia)
spectra(australia) <- sr_no ~ ... ~ 350:2500

s <- rbind(australia, australia, create_new_ids = TRUE)

l <- separate(australia, calibration = 0.6)
s <- rbind(l$validation, l$calibration)



