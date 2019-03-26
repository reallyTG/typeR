library(jcext)


### Name: plot_freqmap_wtypes
### Title: plot_freqmap_wtypes
### Aliases: plot_freqmap_wtypes

### ** Examples

## Not run: 
##D library(jcext)
##D # This is a long running example for plotting results for all types globally
##D cwtGlobal <- extended_jc(press$msl, press$loni,press$lati, press$dates, gale=FALSE, num_cores=2)
##D wtypesGlobal <- cwtGlobal$wtypes
##D plot_freqmap_wtypes(wtypesGlobal,press$loni, press$lati, all.types = TRUE,mytype = NULL ,center = T)
##D # Plot the global results only for one type
##D plot_freqmap_wtypes(wtypesGlobal,press$loni, press$lati, all.types = FALSE,mytype = "C" ,center = T)
## End(Not run)




