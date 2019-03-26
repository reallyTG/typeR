library(imageData)


### Name: designFactors
### Title: Adds the factors and covariates for a blocked, split-plot design
### Aliases: designFactors
### Keywords: data manip

### ** Examples

data(exampleData)
longi.dat <- designFactors(longi.prime.dat, insertName = "xDays",
                           nzones = 1, nlanesperzone = 1, nmainplotsperlane = 10, 
                           designfactorMethod="StandardOrder")



