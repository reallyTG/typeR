library(phenology)


### Name: plot.phenology
### Title: Plot the phenology from a result.
### Aliases: plot.phenology

### ** Examples

## Not run: 
##D library(phenology)
##D # Read a file with data
##D Gratiot <- read.delim("http://max2.ese.u-psud.fr/epc/conservation/BI/Complete.txt", header=FALSE)
##D data(Gratiot)
##D # Generate a formatted list nammed data_Gratiot 
##D data_Gratiot <- add_phenology(Gratiot, name = "Complete", 
##D 		reference = as.Date("2001-01-01"), format="%d/%m/%Y")
##D # Generate initial points for the optimisation
##D parg <- par_init(data_Gratiot, fixed.parameters=NULL)
##D # Run the optimisation
##D result_Gratiot <- fit_phenology(data=data_Gratiot, 
##D 		fitted.parameters=parg, fixed.parameters=NULL)
##D data(result_Gratiot)
##D # Plot the phenology and get some stats
##D output <- plot(result_Gratiot)
##D # Plot only part of the nesting season
##D ptoutput <- plot(result_Gratiot, xlim=c(as.Date("2001-03-01"),as.Date("2001-08-31")))
##D # Use month names in English
##D Sys.setlocale(category = "LC_TIME", locale = "en_GB.UTF-8")
##D output <- plot(result_Gratiot)
##D # set back the month name in local R language
##D Sys.setlocale(category = "LC_TIME", locale = "")
##D # plot based on quantiles of mcmc object
##D plot(result_Gratiot, resultmcmc=result_Gratiot_mcmc, 
##D             plot.objects=c("observations", "MCMC.quantiles"))
##D plot(result_Gratiot, resultmcmc=result_Gratiot_mcmc, 
##D             plot.objects=c("observations", "ML.SD", "ML.quantiles"))
##D plot(result_Gratiot, resultmcmc=result_Gratiot_mcmc, 
##D             plot.objects=c("observations", "ML.SD", "MCMC.quantiles"))
##D plot(result_Gratiot, resultmcmc=result_Gratiot_mcmc, 
##D             plot.objects=c("observations", "ML.quantiles", "MCMC.quantiles"))
## End(Not run)



