library(intubate)


### Name: forecast
### Title: Interfaces for forecast package for data science pipelines.
### Aliases: ntbt_tslm
### Keywords: intubate magrittr forecast tslm

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(forecast)
##D 
##D ## ntbt_tslm: Fit a linear model with time series components
##D dta <- data.frame(y <- ts(rnorm(120,0,3) + 1:120 + 20*sin(2*pi*(1:120)/12), frequency=12))
##D 
##D ## Original function to interface
##D tslm(y ~ trend + season, data = dta)
##D 
##D ## The interface puts data as first parameter
##D ntbt_tslm(dta, y ~ trend + season)
##D 
##D ## so it can be used easily in a pipeline.
##D dta %>%
##D   ntbt_tslm(y ~ trend + season)
## End(Not run)



