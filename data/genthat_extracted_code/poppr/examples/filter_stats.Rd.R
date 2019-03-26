library(poppr)


### Name: filter_stats
### Title: Utilize all algorithms of mlg.filter
### Aliases: filter_stats

### ** Examples


# Basic usage example: Bruvo's Distance --------------------------------
data(Pinf)
pinfreps <- fix_replen(Pinf, c(2, 2, 6, 2, 2, 2, 2, 2, 3, 3, 2))
bres <- filter_stats(Pinf, distance = bruvo.dist, replen = pinfreps, plot = TRUE, threads = 1L)
print(bres) # shows all of the statistics

# Use these results with cutoff_filter()
print(thresh <- cutoff_predictor(bres$farthest$THRESHOLDS))
mlg.filter(Pinf, distance = bruvo.dist, replen = pinfreps) <- thresh
Pinf 

# Different distances will give different results -----------------------
nres <- filter_stats(Pinf, distance = nei.dist, plot = TRUE, threads = 1L, missing = "mean")
print(thresh <- cutoff_predictor(nres$farthest$THRESHOLDS))
mlg.filter(Pinf, distance = nei.dist, missing = "mean") <- thresh
Pinf 



