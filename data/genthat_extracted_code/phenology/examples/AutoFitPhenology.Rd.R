library(phenology)


### Name: AutoFitPhenology
### Title: Automatic fit for phenology and tests
### Aliases: AutoFitPhenology

### ** Examples

## Not run: 
##D library(phenology)
##D # Read a file with data
##D Gratiot <- read.delim("http://max2.ese.u-psud.fr/epc/conservation/BI/Complete.txt", header=FALSE)
##D data(Gratiot)
##D # Generate a formatted list nammed data_Gratiot 
##D data_Gratiot <- add_phenology(Gratiot, name="Complete", 
##D 		reference=as.Date("2001-01-01"), format="%d/%m/%Y")
##D # Run the optimisation
##D result_Gratiot_Auto <- AutoFitPhenology(data=data_Gratiot)
##D result_Gratiot_Auto <- AutoFitPhenology(data=data_Gratiot, 
##D           control=list(trace=0, REPORT=100, maxit=500))
## End(Not run)



