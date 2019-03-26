library(BBMM)


### Name: brownian.bridge
### Title: Brownian bridge movement model
### Aliases: brownian.bridge Brownian bridge movement model
### Keywords: ~Brownian ~bridge ~movement ~GPS ~UD

### ** Examples

data(locations)
BBMM <- brownian.bridge(x=locations$x, y=locations$y, 
            time.lag=locations$time.lag[-1], location.error=20, 
            cell.size=50)

# To export an Ascii grid with probabilities (UD).
# First delete any x and y coords that have probability of use < 0.00000001.
# 	This saves some computing time and reduces the size of the output Ascii file.
# Not run: x <- BBMM$x[BBMM$probability >= 0.00000001]
# Not run: y <- BBMM$y[BBMM$probability >= 0.00000001]
# Not run: z <- BBMM$probability[BBMM$probability >= 0.00000001]
# Not run: tmp <- data.frame(x, y, z) 
# Not run: library(maptools)
# Not run: m <- SpatialPixelsDataFrame(points = tmp[c("x", "y")], data=tmp)
# Not run: m <- as(m, "SpatialGridDataFrame")
# Not run: write.asciigrid(m, "BBMM.asc", attr=3)




