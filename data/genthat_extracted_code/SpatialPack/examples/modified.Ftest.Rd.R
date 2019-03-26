library(SpatialPack)


### Name: modified.Ftest
### Title: Modified F test
### Aliases: modified.Ftest
### Keywords: htest

### ** Examples

# The Pinus Radiata data set
data(radiata)

# defining the response and predictor variables from the radiata data set
y <- radiata$height
x <- radiata[c("basal","altitude","slope")]

# extracting the coordinates from the radiata data set
coords <- radiata[c("xpos","ypos")]

# computing the modified F-test of spatial association
z <- modified.Ftest(x, y, coords)
z

# display the upper bounds, cardinality and the computed Moran's index
summary(z)



