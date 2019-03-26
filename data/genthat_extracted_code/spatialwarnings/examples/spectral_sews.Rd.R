library(spatialwarnings)


### Name: spectral_sews
### Title: Spectrum-based spatial early-warning signals.
### Aliases: spectral_sews indictest.spectral_sews plot.spectral_sews_test
###   plot_spectrum

### ** Examples

## Not run: 
##D 
##D data(serengeti) 
##D data(serengeti.rain) 
##D 
##D 
##D spec_indic <- spectral_sews(serengeti, 
##D                              sdr_low_range  = c(0, .2), 
##D                              sdr_high_range = c(.8, 1))
##D 
##D summary(spec_indic)
##D 
##D # Display trends along the varying model parameter
##D plot(spec_indic, along = serengeti.rain)
##D 
##D # Computing spectra many times is expensive, consider setting parallel 
##D # computing using: options(mc.cores = n)
##D 
##D # Assess significance
##D spec_test <- indictest(spec_indic)
##D summary(spec_test)
##D 
##D # Display the SDR trend, now with a grey ribbon representing 5%-95% 
##D # quantiles of the null distribution
##D plot(spec_test, along = serengeti.rain)
##D 
##D # Add a line highlighting the shift 
##D if (require(ggplot2)) {
##D   plot(spec_test, along = serengeti.rain) + 
##D     geom_vline(xintercept = 590, color = "red", linetype = "dashed")
##D }
##D 
##D 
##D # Display radial-spectra
##D plot_spectrum(spec_indic, along = serengeti.rain)
##D 
##D # Graphics can be modified using ggplot2 functions
##D if (require(ggplot2)) { 
##D   plot_spectrum(spec_indic, along = serengeti.rain) + 
##D     scale_y_log10()
##D }
##D 
## End(Not run)



