library(intubate)


### Name: frontier
### Title: Interfaces for frontier package for data science pipelines.
### Aliases: ntbt_sfa
### Keywords: intubate magrittr frontier sfa

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(frontier)
##D 
##D 
##D ## ntbt_sfa: Stochastic Frontier Analysis
##D data(front41Data)
##D 
##D ## Original function to interface
##D sfa(log(output) ~ log(capital) + log(labour), data = front41Data)
##D 
##D ## The interface puts data as first parameter
##D ntbt_sfa(front41Data, log(output) ~ log(capital) + log(labour))
##D 
##D ## so it can be used easily in a pipeline.
##D front41Data %>%
##D   ntbt_sfa(log(output) ~ log(capital) + log(labour))
## End(Not run)



