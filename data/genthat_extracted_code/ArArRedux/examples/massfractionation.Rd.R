library(ArArRedux)


### Name: massfractionation
### Title: Apply the mass fractionation correction
### Aliases: massfractionation

### ** Examples

data(Melbourne)
C <- calibration(Melbourne$X,"DCAL")
A <- massfractionation(C,Melbourne$fract)
plotcorr(A)



