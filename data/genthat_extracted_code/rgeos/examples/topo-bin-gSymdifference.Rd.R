library(rgeos)


### Name: gSymdifference
### Title: Geometry Symmetric Difference
### Aliases: gSymdifference
### Keywords: spatial

### ** Examples

x = readWKT("POLYGON ((0 0, 0 10, 10 10, 10 0, 0 0))")
y = readWKT("POLYGON ((5 5, 15 5, 15 15, 5 15, 5 5))")

d = gSymdifference(x,y)
plot(d,col='red',pbg='white')



