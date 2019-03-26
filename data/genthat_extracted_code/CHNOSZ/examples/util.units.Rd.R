library(CHNOSZ)


### Name: util.units
### Title: Functions to Convert Units
### Aliases: util.units P.units T.units E.units convert

### ** Examples
## Don't show: 
data(thermo)
## End(Don't show)
## examples using convert
# temperature (Kelvin) to degrees C
convert(273.15, "C")
# temperature (degrees C) to Kelvin
convert(100, "K")
# Gibbs energy (cal mol-1) to/from logK
convert(1000, "logK")		
convert(1000, "logK", T=373.15)
convert(1, "G") 
# Eh (volt) to pe 
convert(-1, "pe")		
convert(-1, "pe", T=373.15)
# logfO2 to E0 (volt)
convert(-80, "E0")             
convert(-80, "E0", pH=5)
convert(-80, "E0", pH=5, logaH2O=-5)
# calorie to/from joule
convert(10, "J")		
convert(10, "cal")
# cm3bar to calories		
convert(10, "calories")

### examples showing unit settings
# make K the units for temperature arguments to subcrt() and affinity()
T.units("K") 
# return to default - degrees C
T.units("C")



