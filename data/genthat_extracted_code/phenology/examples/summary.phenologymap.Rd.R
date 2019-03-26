library(phenology)


### Name: summary.phenologymap
### Title: Print information on a phenologymap object.
### Aliases: summary.phenologymap

### ** Examples

library("phenology")
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
# Extract the fitted parameters
parg1<-extract_result(result_Gratiot)
# Add constant Alpha and Tau values 
# [day d amplitude=(Alpha+Nd*Beta)^Tau with Nd being the number of counts for day d]
pfixed<-c(parg1, Alpha=0, Tau=1)
pfixed<-pfixed[-which(names(pfixed)=="Theta")]
# The only fitted parameter will be Beta
parg2<-c(Beta=0.5, parg1["Theta"])
# Generate a likelihood map 
# [default Phi=seq(from=0.1, to=20, length.out=100) but it is very long]
# Take care, it takes 20 hours ! The data map_Gratiot has the result
## Not run: 
##D map_Gratiot<-map_phenology(data=data_Gratiot, 
##D 		Phi=seq(from=0.1, to=20, length.out=100), 
##D 		fitted.parameters=parg2, fixed.parameters=pfixed)
## End(Not run)
data(map_Gratiot)
# Print the information on a map
summary(map_Gratiot)



