library(intubate)


### Name: nlreg
### Title: Interfaces for nlreg package for data science pipelines.
### Aliases: ntbt_nlreg
### Keywords: intubate magrittr nlreg

### ** Examples

## Not run: 
##D library(intubate)
##D library(magrittr)
##D library(nlreg)
##D 
##D 
##D ## ntbt_nlreg: Fit a Nonlinear Heteroscedastic Model via Maximum Likelihood
##D library(boot)
##D data(calcium)
##D 
##D ## Original function to interface
##D nlreg(cal ~ b0*(1-exp(-b1*time)), weights = ~ ( 1+time^g )^2,
##D       start = c(b0 = 4, b1 = 0.1, g = 1), data = calcium, hoa = TRUE)
##D 
##D ## The interface puts data as first parameter
##D ntbt_nlreg(calcium, cal ~ b0*(1-exp(-b1*time)), weights = ~ ( 1+time^g )^2,
##D            start = c(b0 = 4, b1 = 0.1, g = 1), hoa = TRUE)
##D 
##D ## so it can be used easily in a pipeline.
##D calcium %>%
##D   ntbt_nlreg(cal ~ b0*(1-exp(-b1*time)), weights = ~ ( 1+time^g )^2,
##D              start = c(b0 = 4, b1 = 0.1, g = 1), hoa = TRUE)
## End(Not run)



