library(mvdalab)


### Name: y.loadings
### Title: Extract Summary Information Pertaining to the y-loadings
### Aliases: y.loadings

### ** Examples

data(Penta)
mod1 <- plsFit(log.RAI ~., scale = TRUE, data = Penta[, -1], 
               ncomp = 2, validation = "loo")
y.loadings(mod1)



