library(phenology)


### Name: result_Gratiot
### Title: Result of the fit of Leatherback nest counts
### Aliases: result_Gratiot
### Keywords: datasets

### ** Examples

## Not run: 
##D library(phenology)
##D data(Gratiot)
##D # Generate a formatted list nammed data_Gratiot 
##D data_Gratiot <- add_phenology(Gratiot, name="Complete", 
##D 		reference=as.Date("2001-01-01"), format="%d/%m/%Y")
##D # Generate initial points for the optimisation
##D parg <- par_init(data_Gratiot, fixed.parameters=NULL)
##D # Run the optimisation
##D result_Gratiot <- fit_phenology(data=data_Gratiot, 
##D 		fitted.parameters=parg, fixed.parameters=NULL)
##D # Read a file with result
##D data(result_Gratiot)
## End(Not run)



