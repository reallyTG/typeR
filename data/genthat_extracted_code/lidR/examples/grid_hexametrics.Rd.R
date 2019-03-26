library(lidR)


### Name: grid_hexametrics
### Title: Area-Based Approach in hexagonal cells.
### Aliases: grid_hexametrics

### ** Examples

LASfile <- system.file("extdata", "Megaplot.laz", package="lidR")
lidar = readLAS(LASfile)

col = grDevices::colorRampPalette(c("blue", "cyan2", "yellow", "red"))

# Maximum elevation with a resolution of 8 m
hm = grid_hexametrics(lidar, max(Z), 8)
hexbin::plot(hm, colramp = col, main = "Max Z")

# Mean height with a resolution of 20 m
hm = grid_hexametrics(lidar, mean(Z), 20)
hexbin::plot(hm, colramp = col, main = "Mean Z")

# Define your own new metrics
myMetrics = function(z, i)
{
  metrics = list(
    zwimean = sum(z*i)/sum(i), # Mean elevation weighted by intensities
    zimean  = mean(z*i),       # Mean products of z by intensity
  zsqmean = sqrt(mean(z^2))    # Quadratic mean
  )

  return(metrics)
}

metrics = grid_hexametrics(lidar, myMetrics(Z, Intensity), 10)

hexbin::plot(metrics$zwimean, colramp = col, main = "zwimean")
hexbin::plot(metrics$zimean, colramp = col, main = "zimean")
hexbin::plot(metrics$zsqmean, colramp = col, main = "zsqmean")



