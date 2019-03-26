library(rangeMapper)


### Name: ramp
### Title: *ra*nge *m*apper *p*ipe line.
### Aliases: ramp

### ** Examples

breding_ranges = rgdal::readOGR(system.file(package = "rangeMapper",
     "extdata", "wrens", "vector_combined"), "wrens", verbose = FALSE)[1:50, ]
data(wrens)
d = subset(wrens, select = c('sci_name', 'body_size', 'clutch_size') )
con = ramp("wrens.sqlite", gridSize = 15, spdf = breding_ranges, biotab = d, ID = "sci_name",
            metadata = rangeTraits(), FUN = "median", overwrite = TRUE)
m = rangeMap.fetch(con)
dbDisconnect(con)



