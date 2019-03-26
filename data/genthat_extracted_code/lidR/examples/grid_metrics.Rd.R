library(lidR)


### Name: grid_metrics
### Title: Area-Based Approach
### Aliases: grid_metrics

### ** Examples

LASfile <- system.file("extdata", "Megaplot.laz", package="lidR")
las = readLAS(LASfile)
colors = height.colors(50)

# Canopy surface model with 4 m^2 cells
metrics = grid_metrics(las, max(Z), 2)
plot(metrics, col = colors)

# Mean height with 400-m^2 cells
metrics = grid_metrics(las, mean(Z), 20)
plot(metrics, col = colors)

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

metrics = grid_metrics(las, myMetrics(Z, Intensity))

plot(metrics, col = colors)
plot(metrics, "zwimean", col = colors)
plot(metrics, "zimean", col = colors)
plot(metrics, "zsqmean", col = colors)



