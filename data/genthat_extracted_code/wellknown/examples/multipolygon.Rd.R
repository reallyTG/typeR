library(wellknown)


### Name: multipolygon
### Title: Make WKT multipolygon objects
### Aliases: multipolygon

### ** Examples

## empty multipolygon
multipolygon("empty")
# multipolygon("stuff")

# data.frame
df <- data.frame(long = c(30, 45, 10, 30), lat = c(20, 40, 40, 20))
df2 <- data.frame(long = c(15, 40, 10, 5, 15), lat = c(5, 10, 20, 10, 5))
multipolygon(df, df2, fmt=0)
lint(multipolygon(df, df2, fmt=0))
wktview(multipolygon(df, df2), zoom=3)

# matrix
mat <- matrix(c(df$long, df$lat), ncol = 2)
mat2 <- matrix(c(df2$long, df2$lat), ncol = 2)
multipolygon(mat, mat2, fmt=0)

# list
multipolygon(list(c(30, 20), c(45, 40), c(10, 40), c(30, 20)),
  list(c(15, 5), c(40, 10), c(10, 20), c(5, 10), c(15, 5)), fmt=2)

polys <- list(
  list(c(30, 20), c(45, 40), c(10, 40), c(30, 20)),
  list(c(15, 5), c(40, 10), c(10, 20), c(5, 10), c(15, 5))
)
wktview(multipolygon(polys, fmt=2), zoom=3)

## nested polygons
polys <- list(
  list(c(40, 40), c(20, 45), c(45, 30), c(40, 40)),
  list(
    list(c(20, 35), c(10, 30), c(10, 10), c(30, 5), c(45, 20), c(20, 35)),
    list(c(30, 20), c(20, 15), c(20, 25), c(30, 20))
  )
)
multipolygon(polys, fmt=0)
lint(multipolygon(polys, fmt=0))



# 3D
## data.frame
df <- data.frame(long = c(30, 45, 10, 30), lat = c(20, 40, 40, 20), 
  altitude = 1:4)
df2 <- data.frame(long = c(15, 40, 10, 5, 15), lat = c(5, 10, 20, 10, 5), 
  altitude = 1:5)
multipolygon(df, df2, fmt=0)
multipolygon(df, df2, fmt=0, third = "m")
## matrix
mat <- matrix(unname(unlist(df)), ncol = 3)
mat2 <- matrix(unname(unlist(df2)), ncol = 3)
multipolygon(mat, mat2, fmt=0)
multipolygon(mat, mat2, fmt=0, third = "m")
## list
l1 <- list(c(30, 20, 2), c(45, 40, 2), c(10, 40, 2), c(30, 20, 2))
l2 <- list(c(15, 5, 5), c(40, 10, 5), c(10, 20, 5), c(5, 10, 5), 
  c(15, 5, 5))
multipolygon(l1, l2, fmt=2)
multipolygon(l1, l2, fmt=2, third = "m")


# 4D
## data.frame
df <- data.frame(long = c(30, 45, 10, 30), lat = c(20, 40, 40, 20), 
  altitude = 1:4, weigjht = 20:23)
df2 <- data.frame(long = c(15, 40, 10, 5, 15), lat = c(5, 10, 20, 10, 5), 
  altitude = 1:5, weigjht = 200:204)
multipolygon(df, df2, fmt=0)
## matrix
mat <- matrix(unname(unlist(df)), ncol = 4)
mat2 <- matrix(unname(unlist(df2)), ncol = 4)
multipolygon(mat, mat2, fmt=0)
## list
l1 <- list(c(30, 20, 2, 1), c(45, 40, 2, 1), c(10, 40, 2, 1), c(30, 20, 2, 1))
l2 <- list(c(15, 5, 5, 1), c(40, 10, 5, 1), c(10, 20, 5, 1), c(5, 10, 5, 1), 
  c(15, 5, 5, 1))
multipolygon(l1, l2, fmt=2)



