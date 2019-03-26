library(hrIPW)


### Name: hrData
### Title: A simulated data set
### Aliases: hrData
### Keywords: datasets

### ** Examples

data(hrData, package = "hrIPW")
hrIPW(hrData, time = "time", status = "status", exposure = "Trt",
      variables = paste("X", 1:9, sep = ""), wtype = "ATE-stab")



