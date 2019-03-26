library(BIOMASS)


### Name: computeFeldRegion
### Title: Retrieving Feldpausch regions
### Aliases: computeFeldRegion

### ** Examples

#' # One study site
lat <- 4.08
long <- -52.68
coord <- cbind(long, lat)
## Not run: 
##D FeldRegion <- computeFeldRegion(coord)
## End(Not run)

# Several study sites (here three sites)
long <- c(-52.68, -51.12, -53.11)
lat <- c(4.08, 3.98, 4.12)
coord <- cbind(long, lat)
## Not run: 
##D FeldRegion <- computeFeldRegion(coord)
## End(Not run)




