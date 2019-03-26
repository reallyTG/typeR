library(spacesXYZ)


### Name: toPolar
### Title: Convert CIE Lab and Luv to Polar Form
### Aliases: LCHabfromLab LCHuvfromLuv
### Keywords: XYZ

### ** Examples

LCHabfromLab( c(50,0,0) )   #  a neutral gray
##        L Cab Hab
##  [1,] 50   0   0         # Hue is undefined, but set to 0

LCHabfromLab( c(50,0,20) ) 
##        L Cab Hab
##  [1,] 50  20  90         # 90 degrees, on yellow axis


LCHabfromLab( c(50,0,-20) ) 
##        L Cab Hab
##  [1,] 50  20 270         # 270 degrees, on blue axis




