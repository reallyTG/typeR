library(phenology)


### Name: MinBMinE_to_Min
### Title: Transform a set of parameters from MinB and MinE to Min
### Aliases: MinBMinE_to_Min

### ** Examples

# Read a file with data
# Gratiot<-read.delim("http://max2.ese.u-psud.fr/epc/conservation/BI/Complete.txt", , header=FALSE)
data(Gratiot)
# Generate a formatted list nammed data_Gratiot
refdate <- as.Date("2001-01-01")
data_Gratiot<-add_phenology(Gratiot, name="Complete", reference=refdate, format="%d/%m/%Y")
# Generate initial points for the optimisation
parg<-par_init(data_Gratiot)
# Change the parameters to PMinB and PMinE
parg1<-MinBMinE_to_Min(parameters=parg)



