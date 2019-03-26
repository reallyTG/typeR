library(phenology)


### Name: toggle_Min_PMin
### Title: Transform a set of parameters from Min, MinB or MinE to PMin,
###   PminB or PminE, or reverse
### Aliases: toggle_Min_PMin

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
parg1<-toggle_Min_PMin(parameters=parg)
# And change back to MinB and MinE
parg2<-toggle_Min_PMin(parameters=parg1)



