library(adehabitatHS)


### Name: domain
### Title: Estimation of the Potential Distribution of a Species
### Aliases: domain
### Keywords: spatial multivariate

### ** Examples


## Preparation of the data
data(lynxjura)
map <- lynxjura$map
pts <- lynxjura$locs

## View of the data
image(map)
title(main="Elevation")
points(pts, pch = 3)

## Estimation of habitat suitability map
hsm <- domain(map, pts)

image(hsm, col = grey((1:256)/256))
contour(hsm, add = TRUE)

## Lighter areas are the most used areas

## Potential distribution
hsm <- domain(map, pts, type = "potential", thresh = 0.98)
image(hsm, col = "orange")
title(main = "Habitat suitability map")
points(pts, pch = 3)




