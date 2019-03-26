library(imageData)


### Name: rcontrib
### Title: Computes a measure of how correlated each variable in a set is
###   with the other variable, conditional on a nominated subset of them
### Aliases: rcontrib
### Keywords: data manip

### ** Examples

data(exampleData)
responses <- c("Area","Area.SV","Area.TV", "Image.Biomass", "Max.Height","Centre.Mass",
               "Density", "Compactness.TV", "Compactness.SV")
h <-  rcontrib(responses, longi.dat, include = "Area")



