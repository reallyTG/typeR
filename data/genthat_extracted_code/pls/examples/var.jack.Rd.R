library(pls)


### Name: var.jack
### Title: Jackknife Variance Estimates of Regression Coefficients
### Aliases: var.jack
### Keywords: univar

### ** Examples

data(oliveoil)
mod <- pcr(sensory ~ chemical, data = oliveoil, validation = "LOO",
           jackknife = TRUE)
var.jack(mod, ncomp = 2)



