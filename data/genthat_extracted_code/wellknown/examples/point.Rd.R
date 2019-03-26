library(wellknown)


### Name: point
### Title: Make WKT point objects
### Aliases: point

### ** Examples

## empty point
point("empty")
# point("stuff")

## single point
point(-116.4, 45.2)
point(0, 1)

## single point, from data.frame
df <- data.frame(lon=-116.4, lat=45.2)
point(df)

## many points, from a data.frame
ussmall <- us_cities[1:5, ]
df <- data.frame(long = ussmall$long, lat = ussmall$lat)
point(df)

## many points, from a matrix
mat <- matrix(c(df$long, df$lat), ncol = 2)
point(mat)

## single point, from a list
point(list(c(100.0, 3.101)))

## many points, from a list
point(list(c(100.0, 3.101), c(101.0, 2.1), c(3.14, 2.18)))

## when a 3rd point is included
point(1:3, third = "m")
point(1:3, third = "z")
point(list(1:3, 4:6), third = "m")
point(list(1:3, 4:6), third = "z")
point(matrix(1:9, ncol = 3), third = "m")
point(matrix(1:9, ncol = 3), third = "z")
point(data.frame(1, 2, 3), third = "m")
point(data.frame(1, 2, 3), third = "z")
point(data.frame(1:3, 4:6, 7:9), third = "m")

## when a 4th point is included
point(1:4)
point(list(1:4, 5:8))
point(matrix(1:12, ncol = 4))
point(data.frame(1, 2, 3, 4))
point(data.frame(1:3, 4:6, 7:9, 10:12))



