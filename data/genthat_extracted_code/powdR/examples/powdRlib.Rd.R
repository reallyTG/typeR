library(powdR)


### Name: powdRlib
### Title: Create an XRD reference library
### Aliases: powdRlib

### ** Examples

#load an example xrd_table
data(minerals_xrd)
#load an example phases_table
data(minerals_phases)

#Create a reference library object
xrd_lib <- powdRlib(xrd_table = minerals_xrd,
                    phases_table = minerals_phases)



