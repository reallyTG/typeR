library(spatialwarnings)


### Name: patchdistr_sews_plot
### Title: Early-warning signals based on patch size distributions
### Aliases: patchdistr_sews_plot plot.patchdistr_sews plot_distr

### ** Examples


## Not run: 
##D  
##D data(forestgap)
##D psd_indic <- patchdistr_sews(forestgap)
##D 
##D plot(psd_indic, along = forestgap.pars[ ,"d"]) 
##D 
##D # When along is non-numeric, bars are used for display
##D plot(psd_indic, along = as.factor(forestgap.pars[ ,"d"]))
##D 
##D # Display individual distributions
##D plot_distr(psd_indic, along = forestgap.pars[ ,"d"])
## End(Not run)




