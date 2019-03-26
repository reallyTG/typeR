library(secr)


### Name: make.mask
### Title: Build Habitat Mask
### Aliases: make.mask
### Keywords: datagen

### ** Examples


temptrap <- make.grid(nx = 10, ny = 10, spacing = 30)

## default method: traprect
tempmask <- make.mask(temptrap, spacing = 5)
plot(tempmask)
summary (tempmask)

## make irregular detector array by subsampling 
## form mask by `trapbuffer' method
temptrap <- subset (temptrap, sample(nrow(temptrap), size = 30))
tempmask <- make.mask (temptrap, spacing = 5, type = "trapbuffer")
plot (tempmask)
plot (temptrap, add = TRUE)

## form mask by "pdot" method
temptrap <- make.grid(nx = 6, ny = 6)
tempmask <- make.mask (temptrap, buffer = 150, type = "pdot", 
    pdotmin = 0.0001, detectpar = list(g0 = 0.1, sigma = 30),
    noccasions = 4)
plot (tempmask)
plot (temptrap, add = TRUE)

## Using an ESRI polygon shapefile for clipping (shapefile
## polygons may include multiple islands and holes).
## Requires the `rgdal' package of Roger Bivand, Tim Keitt and Barry Rowlingson

## Not run: 
##D 
##D datadir <- system.file("extdata", package = "secr")
##D possumarea <- rgdal::readOGR(dsn = datadir, layer = "possumarea")
##D 
##D possummask2 <- make.mask(traps(possumCH), spacing = 20,
##D     buffer = 250, type = "trapbuffer", poly = possumarea)
##D par(mar = c(1,6,6,6), xpd = TRUE)
##D plot (possummask2, ppoly = TRUE)
##D plot(traps(possumCH), add = T)
##D par(mar = c(5,4,4,2) + 0.1, xpd = FALSE)
##D 
##D ## if the polygon delineates non-habitat ...
##D seaPossumMask <- make.mask(traps(possumCH), buffer = 1000, 
##D     type = "traprect", poly = possumarea, poly.habitat = FALSE)
##D plot(seaPossumMask)
##D plot(traps(possumCH), add = T)
##D ## this mask is not useful!
##D 
## End(Not run)





