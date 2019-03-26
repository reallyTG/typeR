library(wellknown)


### Name: as_featurecollection
### Title: As featurecollection
### Aliases: as_featurecollection

### ** Examples

str <- 'MULTIPOINT ((100.000 3.101), (101.000 2.100), (3.140 2.180),
(31.140 6.180), (31.140 78.180))'
x <- wkt2geojson(str, fmt = 2)
as_featurecollection(x)



