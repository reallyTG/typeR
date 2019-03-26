library(biogas)


### Name: stdVol
### Title: Correct Gas Volume to 'Standard' Conditions
### Aliases: stdVol
### Keywords: manip

### ** Examples

  # 100 mL, measured at 35 C
  stdVol(100, temp = 35, pres = 1)

  # Or, with different units
  stdVol(100, temp = 35, pres = 103, unit.pres = "kPa", pres.std = 101.325)
  
  # Vectorized
  data(vol)
  head(vol)
  vol$vol.std <- stdVol(vol$vol, temp = 20, pres = 1.02)
  head(vol)
  
  #using options() (recommended!)
  oldoptions <- options(temp.std = 273.15, pres.std = 101325, 
                        unit.temp = 'K', unit.pres = 'Pa')
  vol$vol.std <- stdVol(vol$vol, temp = 293.15, pres = 101325)
  head(vol)
  options(oldoptions)



