library(CENFA)


### Name: departure
### Title: Climatic departure
### Aliases: departure departure,GLdeparture,missing,cnfa-method
###   departure,GLdeparture,missing,Spatial-method
###   departure,Raster,Raster,cnfa-method
###   departure,Raster,Raster,Spatial-method

### ** Examples

dep1 <- departure(x = climdat.hist, y = climdat.fut, s.dat = ABPR, field = "CODE")

# using difRaster as an initial step
# for multi-species comparison

gld <- GLdeparture(x = climdat.hist, y = climdat.fut)
dep2 <- departure(x = gld, s.dat = ABPR, field = "CODE")

# same results either way
all.equal(dep1@df, dep2@df)




