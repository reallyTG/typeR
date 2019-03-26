library(rangeMapper)


### Name: plot,rmap.frame,missing-method
### Title: Plot a rmap.frame
### Aliases: plot,rmap.frame,missing-method

### ** Examples

require(rangeMapper)
breding_ranges = rgdal::readOGR(system.file(package = "rangeMapper",
     "extdata", "wrens", "vector_combined"), "wrens", verbose = FALSE)[1:70, ]
data(wrens)
d = subset(wrens, select = c('sci_name', 'body_mass', 'clutch_size') )
con = ramp("wrens.sqlite", gridSize = 4, spdf = breding_ranges, biotab = d, ID = "sci_name",
            FUN = "median", overwrite = TRUE)
m = rangeMap.fetch(con, c('median_body_mass', 'median_clutch_size'), spatial = FALSE)
plot(m, ncol = 2)

wrens_boundary = rgeos::gUnionCascaded(breding_ranges)
plot(m, ncol = 2, boundary = wrens_boundary)

## Not run: 
##D if(require(extremevalues))
##D plot(m, ncol = 2, outlierDetector = function(x) getOutliersI(x)$limit)
## End(Not run)



