library(intubate)


### Name: rminer
### Title: Interfaces for rminer package for data science pipelines.
### Aliases: ntbt_fit ntbt_mining
### Keywords: intubate magrittr rminer fit mining

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(rminer)
##D 
##D ## ntbt_fit: Fit a supervised data mining model (classification or regression) model
##D x1 <- rnorm(200,100,20)
##D x2 <- rnorm(200,100,20)
##D y <- 0.7*sin(x1/(25*pi))+0.3*sin(x2/(25*pi))
##D dta <- data.frame(x1, x2, y)
##D 
##D ## Original function to interface
##D fit(y ~ x1 + x2, data = dta, model = "mlpe")
##D 
##D ## The interface puts data as first parameter
##D ntbt_fit(dta, y ~ x1 + x2, model = "mlpe")
##D 
##D ## so it can be used easily in a pipeline.
##D dta %>%
##D   ntbt_fit(y ~ x1 + x2, model = "mlpe")
##D 
##D 
##D ## ntbt_mining: Powerful function that trains and tests a particular fit model
##D ##              under several runs and a given validation method
##D ## Original function to interface
##D mining(y ~ x1 + x2, data = dta, model = "mlpe")
##D 
##D ## The interface puts data as first parameter
##D ntbt_mining(dta, y ~ x1 + x2, model = "mlpe")
##D 
##D ## so it can be used easily in a pipeline.
##D dta %>%
##D   ntbt_mining(y ~ x1 + x2, model = "mlpe")
## End(Not run)



