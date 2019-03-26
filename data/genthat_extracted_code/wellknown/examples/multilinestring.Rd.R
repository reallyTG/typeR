library(wellknown)


### Name: multilinestring
### Title: Make WKT multilinestring objects
### Aliases: multilinestring

### ** Examples

## empty multilinestring
multilinestring("empty")
# multilinestring("stuff")

# character string
x <- "MULTILINESTRING ((30 20, 45 40, 10 40), (15 5, 40 10, 10 20))"
multilinestring(x)

# data.frame
df <- data.frame(long = c(30, 45, 10), lat = c(20, 40, 40))
df2 <- data.frame(long = c(15, 40, 10), lat = c(5, 10, 20))
multilinestring(df, df2, fmt=0)
lint(multilinestring(df, df2, fmt=0))
wktview(multilinestring(df, df2), zoom=3)

# matrix
mat <- matrix(c(df$long, df$lat), ncol = 2)
mat2 <- matrix(c(df2$long, df2$lat), ncol = 2)
multilinestring(mat, mat2, fmt=0)

# list
x1 <- list(c(30, 20), c(45, 40), c(10, 40))
x2 <- list(c(15, 5), c(40, 10), c(10, 20))
multilinestring(x1, x2, fmt=2)

polys <- list(
  list(c(30, 20), c(45, 40), c(10, 40)),
  list(c(15, 5), c(40, 10), c(10, 20))
)
wktview(multilinestring(polys, fmt=2), zoom=3)

# 3D
## data.frame
df <- data.frame(long = c(30, 45, 10), lat = c(20, 40, 40), altitude = 1:3)
df2 <- data.frame(long = c(15, 40, 10), lat = c(5, 10, 20), altitude = 1:3)
multilinestring(df, df2, fmt=0)
multilinestring(df, df2, fmt=0, third = "m")
## matrix
mat <- matrix(unname(unlist(df)), ncol = 3)
mat2 <- matrix(unname(unlist(df2)), ncol = 3)
multilinestring(mat, mat2, fmt=0)
multilinestring(mat, mat2, fmt=0, third = "m")
## list
x1 <- list(c(30, 20, 1), c(45, 40, 1), c(10, 40, 1))
x2 <- list(c(15, 5, 0), c(40, 10, 3), c(10, 20, 4))
multilinestring(x1, x2, fmt=2)
multilinestring(x1, x2, fmt=2, third = "m")


# 4D
## data.frame
df <- data.frame(long = c(30, 45, 10), lat = c(20, 40, 40), 
  altitude = 1:3, weight = 4:6)
df2 <- data.frame(long = c(15, 40, 10), lat = c(5, 10, 20), 
  altitude = 1:3, weight = 4:6)
multilinestring(df, df2, fmt=0)
## matrix
mat <- matrix(unname(unlist(df)), ncol = 4)
mat2 <- matrix(unname(unlist(df2)), ncol = 4)
multilinestring(mat, mat2, fmt=0)
## list
x1 <- list(c(30, 20, 1, 40), c(45, 40, 1, 40), c(10, 40, 1, 40))
x2 <- list(c(15, 5, 0, 40), c(40, 10, 3, 40), c(10, 20, 4, 40))
multilinestring(x1, x2, fmt=2)



