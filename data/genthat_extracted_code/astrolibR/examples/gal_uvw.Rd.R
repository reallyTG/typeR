library(astrolibR)


### Name: gal_uvw
### Title: Calculate the Galactic space velocity (U,V,W) of a star
### Aliases: gal_uvw
### Keywords: misc

### ** Examples

#  Compute (U,V,W) for the halo star HD 6755 using measurments by the Hipparcos satellite
#  Result: u=141.2  v = -491.7  w = 93.9        ;km/s

gal_uvw(139, lsr=TRUE, ten(1,9,42.3)*15., ten(61,32,49.5), 628.42, 76.65, -321.4)



