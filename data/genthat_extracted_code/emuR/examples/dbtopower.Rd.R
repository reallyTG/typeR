library(emuR)


### Name: dbtopower
### Title: Function for inter-converting between decibels and a linear
###   scale
### Aliases: dbtopower
### Keywords: math

### ** Examples



# convert 10 dB to a power ratio
vec = dbtopower(10)
# convert dB-data to a power ratio and back to decibels
res = dbtopower(vowlax.dft.5)
res = dbtopower(res, inv=TRUE)




