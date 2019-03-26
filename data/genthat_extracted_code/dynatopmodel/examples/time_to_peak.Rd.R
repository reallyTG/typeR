library(dynatopmodel)


### Name: time_to_peak
### Title: Time between the peak rainfall and the peak discharge
### Aliases: time_to_peak

### ** Examples


require(dynatopmodel)

data(brompton)

with(brompton$storm.run, time_to_peak(rain, qsim))



