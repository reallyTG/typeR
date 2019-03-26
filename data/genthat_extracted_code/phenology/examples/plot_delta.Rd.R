library(phenology)


### Name: plot_delta
### Title: Plot a likelihood lineplot obtained after map_phenology.
### Aliases: plot_delta

### ** Examples

## Not run: 
##D library("phenology")
##D # Read a file with data
##D Gratiot<-read.delim("http://max2.ese.u-psud.fr/epc/conservation/BI/Complete.txt", header=FALSE)
##D data(Gratiot)
##D # Generate a formatted list nammed data_Gratiot 
##D data_Gratiot<-add_phenology(Gratiot, name="Complete", 
##D 		reference=as.Date("2001-01-01"), format="%d/%m/%Y")
##D # Generate initial points for the optimisation
##D parg<-par_init(data_Gratiot, fixed.parameters=NULL)
##D # Run the optimisation
##D result_Gratiot<-fit_phenology(data=data_Gratiot, 
##D 		fitted.parameters=parg, fixed.parameters=NULL)
##D data(result_Gratiot)
##D # Extract the fitted parameters
##D parg1<-extract_result(result_Gratiot)
##D # Add constant Alpha and Tau values 
##D # [day d amplitude=(Alpha+Nd*Beta)^Tau with Nd being the number of counts for day d]
##D pfixed<-c(parg1, Alpha=0, Tau=1)
##D pfixed<-pfixed[-which(names(pfixed)=="Theta")]
##D # The only fitted parameter will be Beta
##D parg2<-c(Beta=0.5, parg1["Theta"])
##D # Generate a likelihood map 
##D # [default Phi=seq(from=0.1, to=20, length.out=100) but it is very long]
##D # Take care, it takes 20 hours ! The data map_Gratiot has the result
##D map_Gratiot<-map_phenology(data=data_Gratiot, 
##D 		Phi=seq(from=0.1, to=20, length.out=100), 
##D 		fitted.parameters=parg2, fixed.parameters=pfixed)
##D data(map_Gratiot)
##D # Plot the min(-Ln L) for Delta varying with Phi equal to the value for maximum likelihood
##D plot_delta(map=map_Gratiot)
##D # Plot the min(-Ln L) for Delta varying with Phi the nearest to 15
##D plot_delta(map=map_Gratiot, Phi=15)
## End(Not run)



