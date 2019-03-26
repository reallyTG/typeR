library(astrolibR)


### Name: uvbybeta
### Title: Derive dereddened colors, metallicity, and Teff from Stromgren
###   colors
### Aliases: uvbybeta
### Keywords: misc

### ** Examples

#  Suppose 5 stars have the following Stromgren parameters.
#  Determine their stellar parameters.  
#  Result: E(b-y) = 0.050    0.414   0.283  0.023  -0.025
#          Teff =   13060    14030   18420  7250    5760
#          M_V =    -0.27    -6.91   -5.94  2.23    3.94
#          radius=  2.71     73.51    39.84 2.02    1.53

by = c(-0.001 ,0.403, 0.244, 0.216, 0.394)
m1 = c(0.105, -0.074, -0.053, 0.167, 0.186)
c1 = c(0.647, 0.215, 0.051, 0.785, 0.362)
hbeta = c(2.75, 2.552, 2.568, 2.743, 0)
nn = c(1,2,3,7,8)   
          
out = uvbybeta(by, m1, c1, hbeta, nn)
c(out$by0, out$teff, out$mv, out$radius)



