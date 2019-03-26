library(cycloids)


### Name: npeaks
### Title: Calculates the number of a cycloid's peaks based on the radii A
###   (fixed circle) and a (moving circle)
### Aliases: npeaks
### Keywords: math

### ** Examples


npeaks(18, 6)      #  3
npeaks(38, 105)    # 38
npeaks(36, 9)      #  4
npeaks(12, 9)      #  4
npeaks(9, 12)      #  3
npeaks(-5, 12)     # NA - only integer numbers > 0 allowed
npeaks(3, 0)       # NA - only integer numbers > 0 allowed
npeaks(3.2, 12)    # NA - only integer numbers > 0 allowed




