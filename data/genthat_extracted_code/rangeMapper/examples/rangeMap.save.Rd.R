library(rangeMapper)


### Name: rangeMap.save
### Title: Save, retrieve and export maps.
### Aliases: rangeMap.save

### ** Examples

require(rangeMapper)
require(rgdal)
breding_ranges = readOGR(system.file(package = "rangeMapper",
     "extdata", "wrens", "vector_combined"), "wrens", verbose = FALSE)[1:50, ]
breding_ranges = spTransform(breding_ranges,
    CRS("+proj=cea +lon_0=0 +lat_ts=30 +x_0=0 +y_0=0
        +ellps=WGS84 +units=m +no_defs") )
data(wrens)
d = subset(wrens, select = c('sci_name', 'body_size', 'body_mass', 'clutch_size') )

con = ramp("wrens.sqlite", gridSize = 500000, spdf = breding_ranges, biotab = d,
            ID = "sci_name", metadata = rangeTraits(),
            FUN = "median", overwrite = TRUE)


lmSlope = function(formula, data) {
    fm = try(lm(formula, data = data), silent = TRUE)
    if (inherits(fm, "try-error"))
        res = NA else res = coef(fm)[2]
    as.numeric(res)
}

# Subsetting by Species and Assembladge
rangeMap.save(con, FUN = lmSlope, biotab = "biotab", biotrait = "body_mass",
    tableName = "slope_bodyMass_clutchSize", formula = log(body_mass) ~ clutch_size,
    list(MAP_species_richness = "species_richness >= 5",
        BIO_biotab = "body_size > 15"
        ), overwrite = TRUE)

## Not run: 
##D # Import raster maps to the current project
##D r = system.file(package = "rangeMapper", "extdata", "etopo1", "etopo1_Americas.tif")
##D rangeMap.save(con, path = r, tableName = "meanAltitude", FUN = mean, overwrite = TRUE)
##D m = rangeMap.fetch(con, spatial = FALSE)
##D plot(m)
##D 
## End(Not run)



