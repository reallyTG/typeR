library(phenology)


### Name: summary.phenologyout
### Title: Print the summary information from a ouput object.
### Aliases: summary.phenologyout

### ** Examples

## Not run: 
##D library(phenology)
##D # Read a file with data
##D Gratiot<-read.delim("http://max2.ese.u-psud.fr/epc/conservation/BI/Complete.txt", header=FALSE)
##D data(Gratiot)
##D # Generate a formatted list nammed data_Gratiot 
##D data_Gratiot <- add_phenology(Gratiot, name="Complete", 
##D 		reference=as.Date("2001-01-01"), format="%d/%m/%Y")
##D # Generate initial points for the optimisation
##D parg<-par_init(data_Gratiot, fixed.parameters=NULL)
##D # Run the optimisation
##D result_Gratiot <- fit_phenology(data=data_Gratiot, 
##D 		fitted.parameters=parg, fixed.parameters=NULL)
##D data(result_Gratiot)
##D # Plot the phenology and get some stats
##D output <- plot(result_Gratiot)
##D # Show the output
##D summary(output)
## End(Not run)



