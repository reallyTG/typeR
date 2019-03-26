library(astrolibR)


### Name: posang
### Title: Compute position angle of source 2 relative to source 1
### Aliases: posang
### Keywords: misc

### ** Examples

#  For the star 56 Per, the Hipparcos catalog gives a position of 
#  RA = 66.15593384, Dec = 33.94988843 for component A, and 
#  RA = 66.15646079, Dec =  33.96100069 for component B.   
#  What is the position angle of B relative to A?
#  Result:  21.4 degrees

ra1 = 66.15593384/15. ;  dc1 = 33.95988843
ra2 = 66.15646079/15. ;  dc2 = 33.96100069
posang(1,ra1,dc1,ra2,dc2)



