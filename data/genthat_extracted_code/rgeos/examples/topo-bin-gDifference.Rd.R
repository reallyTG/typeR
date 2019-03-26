library(rgeos)


### Name: gDifference
### Title: Geometry Difference
### Aliases: gDifference
### Keywords: spatial

### ** Examples

x = readWKT("POLYGON ((0 0, 0 10, 10 10, 10 0, 0 0))")
y = readWKT("POLYGON ((3 3, 7 3, 7 7, 3 7, 3 3))")

d = gDifference(x,y)
plot(d,col='red',pbg='white')

# Empty geometry since y is completely contained with x
d2 = gDifference(y,x)



