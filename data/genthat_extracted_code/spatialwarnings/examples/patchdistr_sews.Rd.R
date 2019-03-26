library(spatialwarnings)


### Name: patchdistr_sews
### Title: Early-warning signals based on patch size distributions
### Aliases: patchdistr_sews

### ** Examples


data(forestgap)

## Not run: 
##D psd_indic <- patchdistr_sews(forestgap)
##D 
##D summary(psd_indic)
##D plot(psd_indic)
##D 
##D # Plots can be modified using ggplot2 directives 
##D if ( require(ggplot2) ) { 
##D   plot(psd_indic) + 
##D     theme_minimal()
##D }
##D 
##D # Export results to a data.frame
##D psd_indic_export <- as.data.frame(psd_indic) 
##D head(psd_indic_export)
##D 
## End(Not run)



