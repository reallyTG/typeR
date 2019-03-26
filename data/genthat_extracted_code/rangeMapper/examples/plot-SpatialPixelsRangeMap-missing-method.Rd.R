library(rangeMapper)


### Name: plot,SpatialPixelsRangeMap,missing-method
### Title: Plot a SpatialPixelsRangeMap
### Aliases: plot,SpatialPixelsRangeMap,missing-method

### ** Examples

breding_ranges = rgdal::readOGR(system.file(package = "rangeMapper",
     "extdata", "wrens", "vector_combined"), "wrens", verbose = FALSE)[1:10, ]
data(wrens)
d = subset(wrens, select = c('sci_name', 'body_size', 'body_mass', 'clutch_size') )
con = ramp("wrens.sqlite", gridSize = 10, spdf = breding_ranges, biotab = d, ID = "sci_name",
            metadata = rangeTraits(), FUN = "median", overwrite = TRUE)
all = rangeMap.fetch(con)
sr = rangeMap.fetch(con, 'species_richness')
plot(sr)
plot(all)



