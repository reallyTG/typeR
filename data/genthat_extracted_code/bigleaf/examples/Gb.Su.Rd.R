library(bigleaf)


### Name: Gb.Su
### Title: Boundary Layer Conductance according to Su et al. 2001
### Aliases: Gb.Su

### ** Examples

# Canopy boundary layer resistance (and kB-1 parameter) for a set of meteorological conditions,
# a leaf characteristic dimension of 1cm, and an LAI of 5
df <- data.frame(Tair=25,pressure=100,wind=c(3,4,5),ustar=c(0.5,0.6,0.65),H=c(200,230,250)) 
Gb.Su(data=df,zh=25,zr=40,d=17.5,Dl=0.01,LAI=5)

# the same meteorological conditions, but larger leaves
Gb.Su(data=df,zh=25,zr=40,d=17.5,Dl=0.1,LAI=5)

# same conditions, large leaves, and sparse canopy cover (LAI = 1.5)
Gb.Su(data=df,zh=25,zr=40,d=17.5,Dl=0.1,LAI=1.5)




