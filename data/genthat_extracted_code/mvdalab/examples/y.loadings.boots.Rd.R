library(mvdalab)


### Name: y.loadings.boots
### Title: Extract Summary Information Pertaining to the y-loadings
### Aliases: y.loadings.boots

### ** Examples

data(Penta)
## Number of bootstraps set to 300 to demonstrate flexibility
## Use a minimum of 1000 (default) for results that support bootstraping
mod1 <- plsFit(log.RAI ~., scale = TRUE, data = Penta[, -1], 
               ncomp = 2, validation = "oob", boots = 300)
y.loadings(mod1)
y.loadings.boots(mod1)



