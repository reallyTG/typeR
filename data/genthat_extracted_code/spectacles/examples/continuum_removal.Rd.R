library(spectacles)


### Name: continuum_removal
### Title: Continuum removal
### Aliases: continuum_removal

### ** Examples


# Loading example data
data(australia)
spectra(australia) <- sr_no ~ ... ~ 350:2500

s <- apply_spectra(australia, continuum_removal)
plot(s)

s <- apply_spectra(australia, continuum_removal, upper = FALSE)
plot(s)




