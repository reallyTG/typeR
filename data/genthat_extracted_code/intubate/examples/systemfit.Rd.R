library(intubate)


### Name: systemfit
### Title: Interfaces for systemfit package for data science pipelines.
### Aliases: ntbt_systemfit
### Keywords: intubate magrittr systemfit

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(systemfit)
##D 
##D 
##D ## ntbt_systemfit: Linear Equation System Estimation
##D data("Kmenta")
##D eqDemand <- consump ~ price + income
##D eqSupply <- consump ~ price + farmPrice + trend
##D system <- list( demand = eqDemand, supply = eqSupply )
##D 
##D 
##D ## Original function to interface
##D fitols <- systemfit(system, data = Kmenta)
##D print(fitols)
##D 
##D ## The interface puts data as first parameter
##D fitols <- ntbt_systemfit(Kmenta, system, "<|F|>")
##D ## Need "<|F|>" (at least for now) to clarify it is a formula
##D print(fitols)
##D 
##D ## so it can be used easily in a pipeline.
##D ## Need "<|F|>" (at least for now) to clarify it is a formula
##D Kmenta %>%
##D   ntbt_systemfit(system, "<|F|>") %>%
##D   print()
## End(Not run)



