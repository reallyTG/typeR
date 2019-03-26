library(GEOmap)


### Name: setplotmat
### Title: set up matrices for selecting from eTOPO5
### Aliases: setplotmat
### Keywords: misc

### ** Examples

PLOC= list(LON=c(138.3152, 139.0214), 
LAT=c(35.09047, 35.57324))

ax = seq(from=PLOC$LON[1],   to=PLOC$LON[2], length=10)
ay = seq(from=PLOC$LAT[1],   to=PLOC$LAT[2], length=10)

 G = setplotmat(ax,ay)




