library(phenology)


### Name: print.phenology
### Title: Print the result information from a result x.
### Aliases: print.phenology

### ** Examples

library(phenology)
# Read a file with data
## Not run: 
##D Gratiot<-read.delim("http://max2.ese.u-psud.fr/epc/conservation/BI/Complete.txt", header=FALSE)
## End(Not run)
data(Gratiot)
# Generate a formatted list nammed data_Gratiot 
data_Gratiot<-add_phenology(Gratiot, name="Complete", 
		reference=as.Date("2001-01-01"), format="%d/%m/%Y")
# Generate initial points for the optimisation
parg<-par_init(data_Gratiot, fixed.parameters=NULL)
# Run the optimisation
## Not run: 
##D result_Gratiot<-fit_phenology(data=data_Gratiot, 
##D 		fitted.parameters=parg, fixed.parameters=NULL)
## End(Not run)
data(result_Gratiot)
# Show the result
result_Gratiot



