library(spectacles)


### Name: Spectra
### Title: Constructor for the Spectra class.
### Aliases: Spectra

### ** Examples


  wls <- 350:2500
  id <- c("A", "B")
  nir <- matrix(runif(2*length(wls)), nrow = 2)
  s <- Spectra(wl = wls, nir = nir, id = id, units = "nm")




