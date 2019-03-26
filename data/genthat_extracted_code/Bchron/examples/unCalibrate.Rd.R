library(Bchron)


### Name: unCalibrate
### Title: Uncalibrate a Radiocarbon date
### Aliases: unCalibrate

### ** Examples

## No test: 
# Single version outputting just an uncalibrated age
unCalibrate(2350, type = 'ages')

# Vector version giving a vector of uncalibrated ages
unCalibrate(calAge = c(2350, 4750, 11440),
  calCurve = 'shcal13',
  type = 'ages')

# A version where calibrated standard deviations are required too
calAge = BchronCalibrate(ages = 11255,
  ageSds = 25,
  calCurves = 'intcal13')
calSampleAges = sampleAges(calAge)

# Uncalibrate the above
unCalibrate(calSampleAges,
  type = 'samples')
## End(No test)



