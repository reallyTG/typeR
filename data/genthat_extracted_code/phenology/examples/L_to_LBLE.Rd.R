library(phenology)


### Name: L_to_LBLE
### Title: Transform a set of parameters from Length format to LengthB
###   LengthE
### Aliases: L_to_LBLE

### ** Examples

## Not run: 
##D # Read a file with data
##D Gratiot<-read.delim("http://max2.ese.u-psud.fr/epc/conservation/BI/Complete.txt", header=FALSE)
## End(Not run)
data(Gratiot)
# Generate a formatted list nammed data_Gratiot 
refdate <- as.Date("2001-01-01")
data_Gratiot<-add_phenology(Gratiot, name="Complete", 
		reference=refdate, format="%d/%m/%Y")
# Generate initial points for the optimisation
parg<-par_init(data_Gratiot, fixed.parameters=NULL)
# Change the parameters to Begin End format
parg1<-LBLE_to_L(parameters=parg)
# And change back to LengthB LengthE.
parg2<-L_to_LBLE(parameters=parg1)



