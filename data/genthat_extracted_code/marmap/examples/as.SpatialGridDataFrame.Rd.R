library(marmap)


### Name: as.SpatialGridDataFrame
### Title: Convert bathymetric data to a spatial grid
### Aliases: as.SpatialGridDataFrame

### ** Examples

# load Hawaii bathymetric data
data(hawaii)

# use as.SpatialGridDataFrame
sp.hawaii <- as.SpatialGridDataFrame(hawaii)

# Summaries
summary(hawaii)
summary(sp.hawaii)

# structure of the SpatialGridDataFrame object
str(sp.hawaii)

# Plots
plot(hawaii,image=TRUE,lwd=.2)
image(sp.hawaii)



