library(geotech)


### Name: hydraulicConductivity
### Title: Hydraulic Conductivity
### Aliases: hydraulicConductivity kConstant kFalling kx kz

### ** Examples


##  Example code for Hydraulic Conductivity from Constant head test
##  k in units of cm/s
kConstant(V = 800, t = 100, h = 200, A = 40, L = 50)

##  Example code for Hydraulic Conductivity from Falling head test
##  k in units of cm/s
kFalling(h0 = 12, hf = 2, L = 10, Ds = 20, Dp = 2, t = 100)



