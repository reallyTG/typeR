library(hutilscpp)


### Name: match_nrst_haversine
### Title: Match coordinates to nearest coordinates
### Aliases: match_nrst_haversine

### ** Examples

lat2 <- runif(5, -38, -37.8)
lon2 <- rep(145, 5)

lat1 <- c(-37.875, -37.91)
lon1 <- c(144.96, 144.978)

match_nrst_haversine(lat1, lon1, lat2, lon2, 0L)
match_nrst_haversine(lat1, lon1, lat1, lon1, 11:12, excl_self = TRUE)




