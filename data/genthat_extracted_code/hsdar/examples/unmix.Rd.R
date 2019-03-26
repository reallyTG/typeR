library(hsdar)


### Name: unmix
### Title: Unmix spectra
### Aliases: unmix
### Keywords: multivariate

### ** Examples

## Not run: 
##D ## Use PROSAIL to generate some vegetation spectra with different LAI
##D parameter <- data.frame(LAI = seq(0, 1, 0.01))
##D spectral_data <- PROSAIL(parameterList = parameter)
##D 
##D ## Get endmember spectra
##D ## Retrieve all available spectra
##D avl <- USGS_get_available_files()
##D 
##D ## Download all spectra matching "grass-fescue"
##D grass_spectra <- USGS_retrieve_files(avl = avl, pattern = "grass-fescue")
##D limestone <- USGS_retrieve_files(avl = avl, pattern = "limestone")
##D 
##D ## Integrate all spectra to Quickbird
##D grass_spectra_qb <- spectralResampling(grass_spectra[1,], "Quickbird")
##D limestone_qb <- spectralResampling(limestone, "Quickbird")
##D spectral_data_qb <- spectralResampling(spectral_data, "Quickbird")
##D 
##D 
##D em <- speclib(spectra = rbind(spectra(grass_spectra_qb), 
##D                               spectra(limestone_qb))/100,
##D               wavelength = wavelength(limestone_qb))
##D 
##D ## Unmix
##D unmix_res <- unmix(spectral_data_qb, em)
##D 
##D unmix_res
##D 
##D plot(unmix_res$fractions[1,] ~ SI(spectral_data_qb)$LAI, type = "l",
##D      xlab = "LAI", ylab = "Unmixed fraction of vegetation")
## End(Not run)



