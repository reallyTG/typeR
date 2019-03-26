library(ArArRedux)


### Name: decaycorrection
### Title: Correct for radioactive decay occurred since irradiation
### Aliases: decaycorrection

### ** Examples

data(Melbourne)
C <- calibration(Melbourne$X,"DCAL")
A <- massfractionation(C,Melbourne$fract)
D9 <- decaycorrection(A,Melbourne$irr,"Ar39")
plotcorr(D9)



