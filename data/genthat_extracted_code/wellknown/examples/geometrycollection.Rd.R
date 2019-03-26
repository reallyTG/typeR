library(wellknown)


### Name: geometrycollection
### Title: Make WKT geometrycollection objects
### Aliases: geometrycollection

### ** Examples

## empty geometrycollection
geometrycollection("empty")
# geometrycollection("stuff")

# Character string, returns itself
geometrycollection("GEOMETRYCOLLECTION(POINT(4 6), LINESTRING(4 6, 7 10))")

# From a point
geometrycollection(point(-116.4, 45.2))

# From two points
geometrycollection(point(-116.4, 45.2), point(-118.4, 49.2))

# From various object types
geometrycollection(point(-116.4, 45.2),
 linestring("LINESTRING (-116.4 45.2, -118.0 47.0)"),
 circularstring(list(c(1, 5), c(6, 2), c(7, 3)), fmt = 2)
)



