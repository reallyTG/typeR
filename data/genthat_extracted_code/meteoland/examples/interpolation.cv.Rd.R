library(meteoland)


### Name: interpolation.cv
### Title: Calibration and validation of interpolation procedures
### Aliases: interpolation.cv interpolation.calibration
###   interpolation.calibration.fmax summary.interpolation.cv
###   plot.interpolation.cv

### ** Examples

data(exampleinterpolationdata)

#Calibration procedure
precEv_cal = interpolation.calibration(exampleinterpolationdata, variable="PrecEvent",
                                       stations = 1:5,
                                       N_seq=c(5,10,15), alpha_seq=seq(0.25,1.0, by=0.25),
                                       verbose = TRUE)

precAm_cal = interpolation.calibration(exampleinterpolationdata, variable="PrecAmount",
                                       stations = 1:5,
                                       N_seq=c(5,10,15), alpha_seq=seq(0.25,1.0, by=0.25),
                                       verbose = TRUE)

#Set 'alpha' and 'N' parameters to values found in calibration
exampleinterpolationdata@params$N_PrecipitationEvent = precEv_cal$N
exampleinterpolationdata@params$alpha_PrecipitationEvent = precEv_cal$alpha

exampleinterpolationdata@params$N_PrecipitationAmount = precAm_cal$N
exampleinterpolationdata@params$alpha_PrecipitationAmount = precAm_cal$alpha

#Run cross validation
cv = interpolation.cv(exampleinterpolationdata, stations = 1:5, verbose = TRUE)

#Print cross validation summaries
summary(cv)

#Plot results
plot(cv)



