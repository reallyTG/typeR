library(seacarb)


### Name: sf_calc
### Title: Calculation of calibrated pH for seaFET sensor
### Aliases: sf_calc
### Keywords: utilities

### ** Examples

sf_calc(calEint=0.0865, calEext= -0.93, E0int25 =-0.39, 
  E0ext25=-1.46, calT=16.2, calSal=35.6)

## Using the test file seaFET
sf_calc(calEint=seaFET$Eint, calEext=seaFET$Eext, 
  E0int25=seaFET$E0int25, E0ext25=seaFET$E0ext25, 
  calT=seaFET$Temperature, calSal=seaFET$Salinity)



