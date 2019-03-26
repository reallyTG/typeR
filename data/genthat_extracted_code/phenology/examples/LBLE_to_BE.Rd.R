library(phenology)


### Name: LBLE_to_BE
### Title: Transform a set of parameters from LengthB LengthE to Begin End.
### Aliases: LBLE_to_BE

### ** Examples

# Read a file with data
# Gratiot<-read.delim("http://max2.ese.u-psud.fr/epc/conservation/BI/Complete.txt", , header=FALSE)
data(Gratiot)
# Generate a formatted list nammed data_Gratiot
refdate <- as.Date("2001-01-01")
data_Gratiot<-add_phenology(Gratiot, name="Complete", reference=refdate, format="%d/%m/%Y")
# Generate initial points for the optimisation
parg<-par_init(data_Gratiot, fixed.parameters=NULL)
# Change the parameters to Begin End format
parg1<-LBLE_to_BE(parameters=parg)
# And change back to LengthB LengthE
parg2<-BE_to_LBLE(parameters=parg1)



