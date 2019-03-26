library(biogas)


### Name: vol2mass
### Title: Calculate Mass of Biogas
### Aliases: vol2mass
### Keywords: manip

### ** Examples

# Mass loss from reactor for 100 mL biogas measured at 20 degrees C 
# and 1.0 atm, with headspace at 1.5 atm and 35 degrees C at the 
# time of biogas exit
vol2mass(100, xCH4 = 0.65, temp.hs = 35, temp.vol = 20, 
         pres.hs = 1.5, pres.vol = 1)

# If the measured volume has already been standardised to dry 
# conditions at 0 C and 1 atm
vol2mass(100, xCH4 = 0.65, temp.hs = 35, temp.vol = 0, 
         pres.hs = 1.5, pres.vol = 1, rh.vol = 0)

# Here vol2mass *is* numerically the inverse of mass2vol
vol2mass(mass2vol(1.234, xCH4 = 0.65, temp = 35, pres = 1.5, 
                  value = "Bg"), 
         xCH4 = 0.65, temp.hs = 35, temp.vol = 0, pres.hs = 1.5, 
         pres.vol = 1, rh.vol = 0)




