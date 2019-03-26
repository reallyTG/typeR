library(wellknown)


### Name: circularstring
### Title: Make WKT circularstring objects
### Aliases: circularstring

### ** Examples

## empty circularstring
circularstring("empty")
# circularstring("stuff")

# Character string
circularstring("CIRCULARSTRING(1 5, 6 2, 7 3)")

# data.frame
df <- data.frame(lon = c(-116.4, -118), lat = c(45.2, 47))
circularstring(df, fmt=1)
df <- data.frame(lon=c(-116.4, -118, -120), lat=c(45.2, 47, 49))
circularstring(df, fmt=1)

# matrix
mat <- matrix(c(-116.4,-118, 45.2, 47), ncol = 2)
circularstring(mat, fmt=1)
mat2 <- matrix(c(-116.4, -118, -120, 45.2, 47, 49), ncol = 2)
circularstring(mat2, fmt=1)

# list
x <- list(c(1, 5), c(6, 2), c(7, 3))
circularstring(x, fmt=2)



