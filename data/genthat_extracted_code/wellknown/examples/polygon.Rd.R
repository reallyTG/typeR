library(wellknown)


### Name: polygon
### Title: Make WKT polygon objects
### Aliases: polygon

### ** Examples

## empty polygon
polygon("empty")
# polygon("stuff")

# numeric
polygon(c(100.001, 0.001), c(101.12345, 0.001), c(101.001, 1.001),
  c(100.001, 0.001), fmt=2)

# data.frame
## single polygon
df <- us_cities[2:5,c('long','lat')]
df <- rbind(df, df[1,])
wktview(polygon(df, fmt=2), zoom=4)
## nested polygons
df2 <- data.frame(long = c(-85.9, -85.9, -93, -93, -85.9),
                  lat = c(37.5, 35.3, 35.3, 37.5, 37.5))
wktview(polygon(df, df2, fmt=2), zoom=4)

# matrix
mat <- matrix(c(df$long, df$lat), ncol = 2)
polygon(mat)

# list
# single list - creates single polygon
ply <- list(c(100.001, 0.001), c(101.12345, 0.001), c(101.001, 1.001),
  c(100.001, 0.001))
wktview(polygon(ply, fmt=2), zoom=7)
# nested list - creates nested polygon
vv <- polygon(list(c(35, 10), c(45, 45), c(15, 40), c(10, 20), c(35, 10)),
   list(c(20, 30), c(35, 35), c(30, 20), c(20, 30)), fmt=2)
wktview(vv, zoom=3)
# multiple lists nested within a list
zz <- polygon(list(list(c(35, 10), c(45, 45), c(15, 40), c(10, 20), c(35, 10)),
   list(c(20, 30), c(35, 35), c(30, 20), c(20, 30))), fmt=2)
wktview(zz, zoom=3)


## a 3rd point is included
### numeric
polygon(c(100, 0, 30), c(101, 0, 30), c(101, 1, 30),
  c(100, 0, 30), fmt = 2)
polygon(c(100, 0, 30), c(101, 0, 30), c(101, 1, 30),
  c(100, 0, 30), fmt = 2, third = "m")

### data.frame
df <- us_cities[2:5, c('long','lat')]
df <- rbind(df, df[1,])
df$altitude <- round(runif(NROW(df), 10, 50))
polygon(df, fmt=2)
polygon(df, fmt=2, third = "m")

### matrix
mat <- matrix(c(df$long, df$lat, df$altitude), ncol = 3)
polygon(mat, fmt=2)
polygon(mat, fmt=2, third = "m")

### list
ply <- list(c(100, 0, 1), c(101, 0, 1), c(101, 1, 1),
  c(100, 0, 1))
polygon(ply, fmt=2)
polygon(ply, fmt=2, third = "m")


## a 4th point is included
### numeric
polygon(c(100, 0, 30, 3.5), c(101, 0, 30, 3.5), c(101, 1, 30, 3.5),
  c(100, 0, 30, 3.5), fmt = 2)

### data.frame
df <- us_cities[2:5, c('long','lat')]
df <- rbind(df, df[1,])
df$altitude <- round(runif(NROW(df), 10, 50))
df$weight <- round(runif(NROW(df), 0, 1), 1)
polygon(df, fmt=2)

### matrix
mat <- matrix(unname(unlist(df)), ncol = 4)
polygon(mat, fmt=2)

### list
ply <- list(c(100, 0, 1, 40), c(101, 0, 1, 44), c(101, 1, 1, 45),
  c(100, 0, 1, 49))
polygon(ply, fmt=2)



