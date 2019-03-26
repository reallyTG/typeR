library(spacesXYZ)


### Name: toXYZ
### Title: Convert other Color Spaces to XYZ
### Aliases: XYZfromxyY XYZfromLab XYZfromLuv
### Keywords: XYZ

### ** Examples

XYZfromxyY(c(0.310897, 0.306510, 74.613450))
##              X        Y        Z
##  [1,] 75.68137 74.61345 93.13427


XYZfromLab( c(50,2,-3), 'D50' )
##               X         Y         Z
##  [1,] 0.1813684 0.1841865 0.1643335



