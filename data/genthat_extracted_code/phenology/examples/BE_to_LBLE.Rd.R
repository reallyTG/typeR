library(phenology)


### Name: BE_to_LBLE
### Title: Transform a set of parameters from Begin End to LengthB LengthE.
### Aliases: BE_to_LBLE

### ** Examples

## Not run: 
##D # Read a file with data
##D Gratiot<-read.delim("http://max2.ese.u-psud.fr/epc/conservation/BI/Complete.txt", 
##D 		header=FALSE)
##D data(Gratiot)
##D # Generate a formatted list nammed data_Gratiot 
##D refdate <- as.Date("2001-01-01")
##D data_Gratiot<-add_phenology(Gratiot, name="Complete", 
##D 		reference=refdate, format="%d/%m/%Y")
##D # Generate initial points for the optimisation
##D parg<-par_init(data_Gratiot, fixed.parameters=NULL)
##D # Change the parameters to Begin End format
##D parg1<-LBLE_to_BE(parameters=parg)
##D # And change back to LengthB LengthE.
##D parg2<-BE_to_LBLE(parameters=parg1)
## End(Not run)



