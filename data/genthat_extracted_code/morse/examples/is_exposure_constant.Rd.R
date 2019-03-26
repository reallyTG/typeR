library(morse)


### Name: is_exposure_constant
### Title: Test in a well-formed argument to function 'survData' if the
###   concentration is constant and different from 'NA' for each replicate
###   (each time-serie)
### Aliases: is_exposure_constant

### ** Examples


# (1) Load the survival data set and test if concentration in replicates is constant
data("propiconazole")
is_exposure_constant(propiconazole)
is_exposure_constant(survData(propiconazole))

 # (1) Load the survival data set and test if concentration in replicates is constant
data("propiconazole_pulse_exposure") 
is_exposure_constant(propiconazole_pulse_exposure)




