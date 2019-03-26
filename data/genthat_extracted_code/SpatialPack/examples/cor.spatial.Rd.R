library(SpatialPack)


### Name: cor.spatial
### Title: Tjostheim's Coefficient
### Aliases: cor.spatial
### Keywords: multivariate

### ** Examples

# Murray Smelter site dataset
data(murray)

# defining the arsenic (As) and lead (Pb) variables from the murray dataset
x <- murray$As
y <- murray$Pb

# extracting the coordinates from Murray dataset
coords <- murray[c("xpos","ypos")]

# computing Tjostheim's coefficient
z <- cor.spatial(x, y, coords)
z



