library(imageData)


### Name: PVA
### Title: Selects a subset of variables using Principal Variable Analysis
###   (PVA)
### Aliases: PVA
### Keywords: data manip

### ** Examples

data(exampleData)
responses <- c("Area","Area.SV","Area.TV", "Image.Biomass", "Max.Height","Centre.Mass",
               "Density", "Compactness.TV", "Compactness.SV")
results <-  PVA(responses, longi.dat, p.variance=0.9, plot = FALSE)



