library(seacarb)


### Name: sf_calib
### Title: Calibration coefficients for seaFET sensor
### Aliases: sf_calib
### Keywords: utilities

### ** Examples

sf_calib(calEint=0.0865, calEext=-0.93, calpH=8.132, calT=16.2, calSal=35.6)

## Using the test file seaFET
sf_calib(calEint=seaFET$Eint, calEext=seaFET$Eext, 
  calpH=seaFET$pHspectro, calT=seaFET$Temperature, 
  calSal=seaFET$Salinity)



