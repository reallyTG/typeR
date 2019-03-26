library(lidR)


### Name: lasmetrics
### Title: Compute metrics for a cloud of points
### Aliases: lasmetrics

### ** Examples

LASfile <- system.file("extdata", "Megaplot.laz", package="lidR")
lidar = readLAS(LASfile)

lasmetrics(lidar, max(Z))
lasmetrics(lidar, mean(Intensity))

# Define your own new metrics
myMetrics = function(z, i)
{
  metrics = list(
     zwimean = sum(z*i)/sum(i), # Mean elevation weighted by intensities
     zimean  = mean(z*i),       # Mean products of z by intensity
     zsqmean = sqrt(mean(z^2))  # Quadratic mean
   )

   return(metrics)
}

metrics = lasmetrics(lidar, myMetrics(Z, Intensity))

# Predefined metrics
lasmetrics(lidar, .stdmetrics)



