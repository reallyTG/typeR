library(intubate)


### Name: minpack.lm
### Title: Interfaces for minpack.lm package for data science pipelines.
### Aliases: ntbt_nlsLM
### Keywords: intubate magrittr minpack.lm nlsLM

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(minpack.lm)
##D 
##D ## ntbt_nlsLM: Standard 'nls' framework that uses 'nls.lm' for fitting
##D DNase1 <- subset(DNase, Run == 1)
##D 
##D ## Original function to interface
##D nlsLM(density ~ Asym/(1 + exp((xmid - log(conc))/scal)),
##D       data = DNase1,
##D       start = list(Asym = 3, xmid = 0, scal = 1))
##D 
##D ## The interface puts data as first parameter
##D ntbt_nlsLM(DNase1, density ~ Asym/(1 + exp((xmid - log(conc))/scal)),
##D            start = list(Asym = 3, xmid = 0, scal = 1))
##D 
##D ## so it can be used easily in a pipeline.
##D DNase1 %>%
##D   ntbt_nlsLM(density ~ Asym/(1 + exp((xmid - log(conc))/scal)),
##D              start = list(Asym = 3, xmid = 0, scal = 1))
## End(Not run)



