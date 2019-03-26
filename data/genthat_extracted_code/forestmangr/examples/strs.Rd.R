library(forestmangr)


### Name: strs
### Title: Stratified Random Sampling
### Aliases: strs
### Keywords: Random Sampling Stratified

### ** Examples

library(forestmangr)
data("exfm1")
data("exfm2")
data("exfm6")

# The objective is to sample an area, with an error of 5%.
# First we run a pilot inventory, considering a 5% error and a finite population:
exfm1

strs(exfm1, "VWB", "PLOT_AREA", "STRATA_AREA", strata = "STRATA", error = 5, pop = "fin")

# With these results, in order to meet the desired error of 5%, we'll need to sample 24 more plots,
# 4 in stratum 1, 8 in stratum 2, and 12 in stratum 3.
# After sampling the necessary plots, we now run a definitive inventory,
# considering an 5% error and a finite population:
exfm2

strs(exfm2, "VWB", "PLOT_AREA", "STRATA_AREA", strata = "STRATA", error = 5, pop = "fin")

# The desired error value was met.

# Area values can be numeric:
strs(exfm2, "VWB", 1000, c(14.4, 16.4,14.2), strata = "STRATA", error = 5, pop = "fin")

# Optional variable age, and one stratified sampled inventory for each map:
exfm6

strs(exfm6, "VWB", "PLOT_AREA", "STRATA_AREA", strata ="STRATA", .groups = "MAP", age = "AGE")




