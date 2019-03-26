library(wellknown)


### Name: wellknown-package
### Title: WKT to GeoJSON and vice versa
### Aliases: wellknown-package wellknown
### Keywords: package

### ** Examples

# GeoJSON to WKT
point <- list(Point = c(116.4, 45.2, 11.1))
geojson2wkt(point)

# WKT to GeoJSON
str <- "POINT (-116.4000000000000057 45.2000000000000028)"
wkt2geojson(str)

## lint WKT
lint("POINT (1 2)")
lint("POINT (1 2 3 4 5)")

# WKT <--> WKB
wkt_wkb("POINT (-116.4 45.2)")
wkb_wkt(wkt_wkb("POINT (-116.4 45.2)"))



