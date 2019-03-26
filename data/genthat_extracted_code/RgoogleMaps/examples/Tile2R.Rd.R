library(RgoogleMaps)


### Name: Tile2R
### Title: simple utility to offset and scale XY coordinates with respect
###   to the center
### Aliases: Tile2R

### ** Examples



latR <- c(34.5,34.9);


 lonR <- c(-100.3, -100);


 lat.center <- 34.7;


 lon.center <- -100.2;


 zoom = 10;


 ll <- LatLon2XY(latR[1], lonR[1], zoom);#lower left corner


 ur <- LatLon2XY(latR[2], lonR[2], zoom );#upper right corner


 cr <- LatLon2XY(lat.center, lon.center, zoom );#center


 ll.Rcoords <- Tile2R(ll, cr);


 ur.Rcoords <- Tile2R(ur, cr);








