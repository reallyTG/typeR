library(lidR)


### Name: stdmetrics
### Title: Predefined standard metrics functions
### Aliases: stdmetrics .stdmetrics stdmetrics_z .stdmetrics_z stdmetrics_i
###   .stdmetrics_i stdmetrics_rn .stdmetrics_rn stdmetrics_pulse
###   .stdmetrics_pulse stdmetrics_ctrl .stdmetrics_ctrl stdtreemetrics
###   .stdtreemetrics
### Keywords: datasets

### ** Examples

LASfile <- system.file("extdata", "Megaplot.laz", package="lidR")
las = readLAS(LASfile, select = "*")

# All the predefined metrics
m1 = grid_metrics(las, stdmetrics(X,Y,Z,Intensity,ReturnNumber,Classification,dz=1))

# Convenient shortcut
m2 = grid_metrics(las, .stdmetrics)

# Basic metrics from intensities
m3 = grid_metrics(las, stdmetrics_i(Intensity))

# All the metrics from intensities
m4 = grid_metrics(las, stdmetrics_i(Intensity, Z, Classification, ReturnNumber))

# Convenient shortcut for the previous example
m5 = grid_metrics(las, .stdmetrics_i)

# Compute the metrics only on first return
first = lasfilterfirst(las)
m6 = grid_metrics(first, .stdmetrics_z)

# Compute the metrics with a threshold at 2 meters
over2 = lasfilter(las, Z > 2)
m7 = grid_metrics(over2, .stdmetrics_z)

# Works also with lasmetrics and grid_hexametrics
m8 = lasmetrics(las, .stdmetrics)
m9 = grid_hexametrics(las, .stdmetrics)

# Combine some predefined function with your own new metrics
# Here convenient shortcuts are no longer usable.
myMetrics = function(z, i, rn)
{
  first  = rn == 1L
  zfirst = z[first]
  nfirst = length(zfirst)
  above2 = sum(z > 2)

  x = above2/nfirst*100

  # User's metrics
  metrics = list(
     above2aboven1st = x,       # Num of returns above 2 divided by num of 1st returns
     zimean  = mean(z*i),       # Mean products of z by intensity
     zsqmean = sqrt(mean(z^2))  # Quadratic mean of z
   )

  # Combined with standard metrics
  return( c(metrics, stdmetrics_z(z)) )
}

m10 = grid_metrics(las, myMetrics(Z, Intensity, ReturnNumber))

# Users can write their own convenient shorcuts like this:
.myMetrics = ~myMetrics(Z, Intensity, ReturnNumber)

m11 = grid_metrics(las, .myMetrics)



