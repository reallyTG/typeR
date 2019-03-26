library(imageData)


### Name: intervalPVA
### Title: Selects a subset of variables observed within a specified time
###   interval using Principal Variable Analysis (PVA)
### Aliases: intervalPVA
### Keywords: data manip

### ** Examples

data(exampleData)
responses <- c("Area","Area.SV","Area.TV", "Image.Biomass", "Max.Height","Centre.Mass",
               "Density", "Compactness.TV", "Compactness.SV")
results <-  intervalPVA(responses, longi.dat, 
                        start.time = "31", end.time = "31",
                        p.variance=0.9, plot = FALSE)



