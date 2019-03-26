library(sdm)


### Name: calibration
### Title: Calibration
### Aliases: calibration calibration,vector,vector-method
###   calibration,sdmEvaluate,missing-method
### Keywords: spatial,species,data

### ** Examples




ca <- calibration(x=c(1,1,0,1,0,0,0,1,1,1,0),
          p=c(0.69,0.04,0.05,0.95,0.04,0.65,0.09,0.61,0.75,0.84,0.15))

ca

plot(ca)





