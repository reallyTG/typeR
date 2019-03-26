library(astrolibR)


### Name: xyz
### Title: Calculate geocentric X,Y, and Z and velocity coordinates of the
###   Sun
### Aliases: xyz
### Keywords: misc

### ** Examples

	
#   What were the rectangular coordinates of the Sun on 
#  Jan 22, 1999 0h UT (= JD 2451200.5) in J2000 coords? 
#  NOTE: Astronomical Almanac (AA) is in TDT, so add 64 seconds to UT to convert.

xyz(51200.5+64./86400, equinox=2000)

#   Compare to Astronomical Almanac (1999 page C20)
#              X  (AU)        Y  (AU)     Z (AU)
#  XYZ:      0.51456871   -0.76963263  -0.33376880
#  AA:       0.51453130   -0.7697110   -0.3337152
#  abs(err): 0.00003739    0.00007839   0.00005360
#  abs(err)
#      (km):   5609          11759         8040 




