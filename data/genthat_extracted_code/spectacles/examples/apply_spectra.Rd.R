library(spectacles)


### Name: apply_spectra
### Title: Apply a function on the spectra of a Spectra* object
### Aliases: apply_spectra

### ** Examples


# Loading example data
data(australia)
spectra(australia) <- sr_no ~ ... ~ 350:2500

# Second derivative
r <- apply_spectra(australia, diff, 2)
plot(r)

# Smoothing kernel
k <- kernel("daniell", 20) # define a kernel
r <- apply_spectra(australia, kernapply, k)
plot(r)

## Not run: 
##D # Savitzky-Golay filter (from the signal package)
##D library(signal)
##D r <- apply_spectra(australia, sgolayfilt, n = 33, p = 4)
##D plot(r)
## End(Not run)




