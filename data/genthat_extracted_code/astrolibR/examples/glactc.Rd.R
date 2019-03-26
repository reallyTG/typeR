library(astrolibR)


### Name: glactc
### Title: Convert between celestial and Galactic (or Supergalactic)
###   coordinates
### Aliases: glactc
### Keywords: misc

### ** Examples

# Find the Galactic coordinates of Altair (RA (J2000): 19 50 47 Dec (J2000): 08 52 06)
# Result: gl = 47.74, gb = -8.91

glactc(ten(19,50,47), ten(8,52,6), 2000, gl, gb, 1)



