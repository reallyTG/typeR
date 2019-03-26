library(phenology)


### Name: phenology-package
### Title: Tools to Manage a Parametric Function that Describes Phenology
### Aliases: phenology-package
### Keywords: Clutch ECF Ecology OCF Phenology Seasonality tagloss

### ** Examples

## Not run: 
##D library(phenology)
##D # Get the lastest version at:
##D # install.packages("http://www.ese.u-psud.fr/epc/conservation/CRAN/phenology.tar.gz", 
##D      repos=NULL, type="source")
##D # Read a file with data
##D data(Gratiot)
##D # Generate a formatted list nammed data_Gratiot 
##D data_Gratiot <- add_phenology(Gratiot, name="Complete", 
##D 		reference=as.Date("2001-01-01"), format="%d/%m/%Y")
##D # Generate initial points for the optimisation
##D parg <- par_init(data_Gratiot, fixed.parameters=NULL)
##D # Run the optimisation
##D result_Gratiot <- fit_phenology(data=data_Gratiot, 
##D 		fitted.parameters=parg, fixed.parameters=NULL)
##D data(result_Gratiot)
##D # Plot the phenology and get some stats
##D output <- plot(result_Gratiot)
## End(Not run)



