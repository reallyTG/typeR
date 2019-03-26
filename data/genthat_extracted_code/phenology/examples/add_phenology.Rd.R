library(phenology)


### Name: add_phenology
### Title: Create a new dataset or add a timeserie to a previous dataset.
### Aliases: add_phenology

### ** Examples

## Not run: 
##D # Get the lastest version at:
##D # install.packages("http://www.ese.u-psud.fr/epc/conservation/CRAN/phenology.tar.gz", 
##D      repos=NULL, type="source")
##D library(phenology)
##D # Read a file with data
##D Gratiot<-read.delim("http://max2.ese.u-psud.fr/epc/conservation/BI/Complete.txt", header=FALSE)
##D data(Gratiot)
##D # Generate a formatted list nammed data_Gratiot 
##D refdate <- as.Date("2001-01-01")
##D data_Gratiot <- add_phenology(Gratiot, name="Complete", 
##D 	reference=refdate, format="%d/%m/%Y")
##D # Generate initial points for the optimisation
##D parg <- par_init(data_Gratiot, fixed.parameters=NULL)
##D # Run the optimisation
##D result_Gratiot <- fit_phenology(data=data_Gratiot, fitted.parameters=parg, 
##D 	fixed.parameters=NULL)
##D data(result_Gratiot)
##D # Plot the phenology and get some stats
##D output <- plot(result_Gratiot)
## End(Not run)



