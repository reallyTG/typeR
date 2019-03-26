library(wellknown)


### Name: multipoint
### Title: Make WKT multipoint objects
### Aliases: multipoint

### ** Examples

## empty multipoint
multipoint("empty")
# multipoint("stuff")

# numeric
multipoint(c(100.000, 3.101), c(101.000, 2.100), c(3.140, 2.180))

# data.frame
df <- us_cities[1:25, c('long', 'lat')]
multipoint(df)

# matrix
mat <- matrix(c(df$long, df$lat), ncol = 2)
multipoint(mat)

# list
multipoint(list(c(100.000, 3.101), c(101.000, 2.100), c(3.140, 2.180)))


## a 3rd point is included
multipoint(c(100, 3, 0), c(101, 2, 0), c(3, 2, 0), 
  third = "z", fmt = 1)
multipoint(c(100, 3, 0), c(101, 2, 0), c(3, 2, 0), 
  third = "m", fmt = 1)

df <- us_cities[1:25, c('long', 'lat')]
df$altitude <- round(runif(25, 100, 500))
multipoint(df, fmt = 2)
multipoint(df, fmt = 2, third = "m")

mat <- matrix(1:9, 3)
multipoint(mat)
multipoint(mat, third = "m")

x <- list(c(100, 3, 0), c(101, 2, 1), c(3, 2, 5))
multipoint(x)


## a 4th point is included
multipoint(
  c(100, 3, 0, 500), c(101, 2, 0, 505), c(3, 2, 0, 600), 
  fmt = 1)

df <- us_cities[1:25, c('long', 'lat')]
df$altitude <- round(runif(25, 100, 500))
df$weight <- round(runif(25, 1, 100))
multipoint(df, fmt = 2)

mat <- matrix(1:12, 3)
multipoint(mat)

x <- list(c(100, 3, 0, 300), c(101, 2, 1, 200), c(3, 2, 5, 100))
multipoint(x, fmt = 3)



