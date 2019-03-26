library(imageData)


### Name: longitudinalPrime
### Title: Selects a set variables to be retained in a data frame of
###   longitudinal data
### Aliases: longitudinalPrime
### Keywords: data manip

### ** Examples

data(exampleData)
longiPrime.dat <- longitudinalPrime(data=raw.dat, smarthouse.lev=1)

longiPrime.dat <- longitudinalPrime(data=raw.dat, smarthouse.lev=1, 
                                    traits = list(a = "Area", c = "Compactness"),
                                    labsCamerasViews = list(all = c("SV1", "SV2", "TV"), 
                                                            t = "TV"))

longiPrime.dat <- longitudinalPrime(data=raw.dat, smarthouse.lev=1, 
                                    traits = c("Area.SV1", "Area.SV2", "Area.TV", 
                                               "Compactness.TV"),
                                    labsCamerasViews = NULL)

longiPrime.dat <- longitudinalPrime(data=raw.dat, smarthouse.lev=1, 
                                    calcWaterLoss = FALSE, 
                                    traits = list(img = c("Area", "Compactness"), 
                                                  H20 = c("Weight.Before","Weight.After",
                                                          "Water.Amount")),
                                    labsCamerasViews = list(all = c("SV1", "SV2", "TV"), 
                                                            H2O = NULL))



