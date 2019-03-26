library(lidR)


### Name: epsg
### Title: Get or set epsg code of a LAS* object
### Aliases: epsg epsg<- epsg,LASheader-method epsg<-,LASheader-method
###   epsg,LAS-method epsg<-,LAS-method

### ** Examples

LASfile <- system.file("extdata", "Megaplot.laz", package="lidR")
las = readLAS(LASfile)

projection(las)
epsg(las)

# Changing the CRS via projection updates the proj4string but not the header
# The proj4string will be propagated in all subsequent spatial objects but the las file
# itself will still have the epsg code 26917 if written on the disk
projection(las) = sp::CRS("+init=epsg:2567")
projection(las)
epsg(las)

# Changing the CRS via epsg updates the proj4string and the header. This way the good CRS will
# written in the las file (if written).
epsg(las) = 2567
epsg(las)
projection(las)



