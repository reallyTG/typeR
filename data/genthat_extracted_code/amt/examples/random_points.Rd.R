library(amt)


### Name: random_points
### Title: Generate random points
### Aliases: random_points random_points.mcp random_points.kde
###   random_points.track_xy

### ** Examples


data(deer)

# track_xyt ---------------------------------------------------------------
# Default settings
rp1 <- random_points(deer)
rp2 <- random_points(deer, hr = "kde") # we need a larger template raster for kde

## Not run: 
##D plot(rp1)
##D plot(rp2)
## End(Not run)

# rp2 does not make sense, because the `trast` is to small.
# this can be overcome by increasing the trast manually.
trast <- raster(bbox(deer, buffer = 2000), res = 30)
rp3 <- random_points(deer, hr = "kde", trast = trast) # we need a larger template raster

 ## Not run: 
##D plot(rp2)
##D plot(rp3)
## End(Not run)


# Only one random point for each observed point
rp <- random_points(deer, factor = 1)
## Not run: 
##D plot(rp)
## End(Not run)

# Within a home range -----------------------------------------------------
hr <- hr_mcp(deer, level = 1)

# 100 random point within the home range
rp <- random_points(hr, n = 100)
## Not run: 
##D plot(rp)
## End(Not run)

# 100 regular point within the home range
rp <- random_points(hr, n = 100, type = "regular")
## Not run: 
##D plot(rp)
## End(Not run)
# 100 hexagonal point within the home range
rp <- random_points(hr, n = 100, type = "hexagonal")
## Not run: 
##D plot(rp)
## End(Not run)




