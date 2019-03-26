library(phenology)


### Name: extract_result
### Title: Extract the set of parameters from a result object.
### Aliases: extract_result

### ** Examples

library(phenology)
## Not run: 
##D # Read a file with data
##D Gratiot<-read.delim("http://max2.ese.u-psud.fr/epc/conservation/BI/Complete.txt", \cr
##D 		header=FALSE)
##D data(Gratiot)
##D # Generate a formatted list nammed data_Gratiot 
##D data_Gratiot<-add_phenology(Gratiot, name="Complete", 
##D 		reference=as.Date("2001-01-01"), format="%d/%m/%Y")
##D # Generate initial points for the optimisation
##D parg<-par_init(data_Gratiot, fixed.parameters=NULL)
##D # Run the optimisation
##D # result_Gratiot<-fit_phenology(data=data_Gratiot, fitted.parameters=parg, 
##D 		fixed.parameters=NULL)
##D data(result_Gratiot)
##D # Extract the fitted parameters
##D parg1<-extract_result(result_Gratiot)
## End(Not run)



