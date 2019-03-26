library(gglogo)


### Name: createPolygons
### Title: Create a data set of polygons for a set of letters from a
###   specified fontfamily
### Aliases: createPolygons

### ** Examples

## No test: 
# check that all letters and digits are nicely shaped:
new_alphabet <- createPolygons(c("f", "g", "W", "*"), font="Garamond")

library(ggplot2)
qplot(x,y, geom="polygon", data=new_alphabet, facets=~group)
## End(No test)



