library(phenology)


### Name: adapt_parameters
### Title: Extract the parameters from a set of parameters to be used with
###   another dataset.
### Aliases: adapt_parameters

### ** Examples

library(phenology)
# Read a file with data
data(Gratiot)
# Generate a formatted list nammed data_Gratiot 
refdate <- as.Date("2001-01-01")
data_Gratiot<-add_phenology(Gratiot, name="Complete", 
		reference=refdate, format="%d/%m/%Y")
# Generate initial points for the optimisation
parg<-par_init(data_Gratiot, fixed.parameters=NULL)
# Add unnecessary parameters to parg
parg <- c(parg, Max_dummybeach=2, Peak_dummybeach=123)
# Extract the fitted parameters
parg1<-adapt_parameters(data=data_Gratiot, parameters=parg)



