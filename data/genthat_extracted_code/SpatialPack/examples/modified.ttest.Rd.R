library(SpatialPack)


### Name: modified.ttest
### Title: Modified t test
### Aliases: modified.ttest
### Keywords: htest

### ** Examples

# Murray Smelter site dataset
data(murray)

# defining the arsenic (As) and lead (Pb) variables from the murray dataset
x <- murray$As
y <- murray$Pb

# extracting the coordinates from Murray dataset
coords <- murray[c("xpos","ypos")]

# computing the modified t-test of spatial association
z <- modified.ttest(x, y, coords)
z

# display the upper bounds, cardinality and the computed Moran's index
summary(z)



