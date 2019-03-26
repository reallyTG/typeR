library(colorSpec)


### Name: ABC
### Title: Standard Illuminants A, B, and C (1931)
### Aliases: A.1nm B.5nm C.5nm ABC
### Keywords: datasets light

### ** Examples

summary(xyz1931.1nm)
white.point = product( D65.1nm, xyz1931.1nm, wave='auto' )



