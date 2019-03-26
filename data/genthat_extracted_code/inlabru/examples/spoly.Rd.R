library(inlabru)


### Name: spoly
### Title: Convert a data.frame of boundary points into a
###   SpatialPolgonsDataFrame
### Aliases: spoly

### ** Examples

## No test: 
# Create data frame of boundary points (anti clockwise!)
pts = data.frame(x = c(1,2,1.7,1.3),
                 y = c(1,1,2,2))

# Convert to SpatialPolygonsDataFrame
pol = spoly(pts, crs = CRS(as.character(NA)))

# Plot it!
ggplot() + gg(pol)
## End(No test)



