library(fetchR)


### Name: fetch
### Title: Calculate Wind Fetch
### Aliases: fetch

### ** Examples


# Create the polygon layer ----------------------------------------
#
# This is the layer that represents any obstacles that obstruct wind flow.

# Import map data for the Philippines.
philippines.df = ggplot2::map_data("world", region = "Philippines")

# Create a list for each separate polygon
philippines.list = split(philippines.df[, c("long", "lat")], 
                         philippines.df$group)
                         
library(sp)

philippines.Poly = lapply(philippines.list, Polygon)
philippines.Polys = list(Polygons(philippines.Poly, ID = "Philippines"))

# Include CRS information to make it a SpatialPolygons object
philippines.sp = SpatialPolygons(philippines.Polys, 
                                     proj4string = CRS("+init=epsg:4326"))

# Create the points layer ----------------------------------------
#
# The points layer represents the locations for which the wind fetch needs to
# be calculated.

# We need to calculate wind fetch for the following 3 sites:
sites.df = data.frame(lon = c(124.4824, 125.8473, 124.8416),
                      lat = c(9.167999, 9.751394, 11.478243),
                      site = c("Camiguin Island", "Bucas Grande Island",
                               "Talalora"))
                      
# Create the SpatialPoints object
sites.sp = SpatialPoints(sites.df[, 1:2], CRS("+init=epsg:4326"))

# Map projection -------------------------------------------------
#
# At least one of the polygon or points layers need to be projected to 
# calculate wind fetch.

# All these locations lie within the Philippines zone 5 / PRS92, that has
# WGS84 Bounds: 123.8000, 5.3000, 126.7000, 12.7500
# (http://spatialreference.org/ref/epsg/3125/)
# This suggests that this is a suitable map projection.
philippines.proj = spTransform(philippines.sp, "+init=epsg:3125")

# Calculate wind fetch -------------------------------------------
# 
# Calculate wind fetch at all the 3 locations for every 10 degrees on the
# compass rose, with a maximum distance for any fetch vector of 300 km.
my_fetch = fetch(philippines.proj, sites.sp, site_names = sites.df$site)
my_fetch

# Return only the summary data frame
summary(my_fetch)

# Transform the fetch vectors back to the original CRS
my_fetch_latlon = spTransform(my_fetch, proj4string(philippines.sp))

# Return the raw data in the original, lat/lon coordinates
my_fetch_latlon.df = as(my_fetch_latlon, "data.frame")
my_fetch_latlon.df

# Plot the wind fetch vectors ------------------------------------

# Plot the fetch vectors in the projected space...
plot(my_fetch, philippines.proj, axes = TRUE)

# ... or in the original coordinate reference system
plot(my_fetch, philippines.sp, axes = TRUE)

# Output to KML --------------------------------------------------
## Not run: 
##D 
##D # Save a KML file in the current working directory.
##D kml(my_fetch, colour = "white")
## End(Not run)



