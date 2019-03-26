library(afmToolkit)


### Name: afmExtract
### Title: Extract computed parameters from an afmexperiment
### Aliases: afmExtract

### ** Examples

## Not run: 
##D require(dplyr) # Not really necessary
##D 
##D # Load the data
##D data(batchExperiment)
##D 
##D # Process the afmexperiment
##D data <- afmContactPoint(batchExperiment, width = 50, mul1 = 1, mul2 = 10)
##D data <- afmDetachPoint(data, width = 50, mul1 = 1, mul2 = 10)
##D data <- afmBaselineCorrection(data)
##D data <- afmZeroPointSlope(data)
##D data <- afmIndentation(data)
##D data <- afmYoungModulus(data, thickness = 2e-7, params = list(alpha = 22))
##D data <- afmExpDecay(data, plt = FALSE)
##D data <- afmAdhesionEnergy(data, mul = 7)
##D 
##D # Extract the values of the parameters obtained in the analysis
##D afmExpParams <- afmExtract(data, opt.param = "type")
##D 
##D # Plotting the Young's Modulus
##D afmExpParams[[1]] %>% ggplot(aes(x = type, y = YM)) + geom_boxplot() 
##D ylab("Young's Modulus  (Pa)")
## End(Not run)



