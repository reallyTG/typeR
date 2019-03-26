library(lawn)


### Name: lawn_geosjontype
### Title: Enforce expectations about types of GeoJSON objects.
### Aliases: lawn_geosjontype

### ** Examples

# all okay
x <- "{ type: 'Point', coordinates: [10, 50] }"
lawn_geosjontype(x, 'Point', 'fooBar')

# error
# lawn_geosjontype(x, 'Polygon', 'fooBar')



