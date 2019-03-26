library(lidR)


### Name: tree_metrics
### Title: Compute metrics for each tree
### Aliases: tree_metrics

### ** Examples

LASfile <- system.file("extdata", "MixedConifer.laz", package="lidR")
las = readLAS(LASfile, filter = "-drop_z_below 0")

# Mean height and mean intensity for each tree
metrics = tree_metrics(las, list(`Mean Z` = mean(Z), `Mean I` = mean(Intensity)))

# Define your own new metrics function
myMetrics = function(z, i)
{
  metrics = list(
     imean = mean(i),
     imax  = max(i),
     npoint = length(z)
   )

   return(metrics)
}

metrics = tree_metrics(las, myMetrics(Z, Intensity))

# predefined metrics (see ?stdmetrics)
metrics = tree_metrics(las, .stdtreemetrics)



