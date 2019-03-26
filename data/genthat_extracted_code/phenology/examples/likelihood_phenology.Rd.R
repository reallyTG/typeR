library(phenology)


### Name: likelihood_phenology
### Title: Estimate the likelihood of timeseries based on a set of
###   parameters.
### Aliases: likelihood_phenology

### ** Examples

## Not run: 
##D # Read a file with data
##D Gratiot<-read.delim("http://max2.ese.u-psud.fr/epc/conservation/BI/Complete.txt", header=FALSE)
##D data(Gratiot)
##D # Generate a formated list nammed data_Gratiot 
##D data_Gratiot<-add_phenology(Gratiot, name="Complete", 
##D 		reference=as.Date("2001-01-01"), format="%d/%m/%Y")
##D # Generate initial points for the optimisation
##D parg<-par_init(data_Gratiot, fixed.parameters=NULL)
##D # Estimate likelihood with this initial set of parameters
##D likelihood_phenology(data=data_Gratiot, fitted.parameters=parg, fixed.parameters=NULL)
##D # Or directly from a result object
##D likelihood_phenology(result=result_Gratiot)
## End(Not run)



