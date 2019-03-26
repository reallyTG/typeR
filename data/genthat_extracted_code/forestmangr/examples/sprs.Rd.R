library(forestmangr)


### Name: sprs
### Title: Simple Random Sampling
### Aliases: sprs
### Keywords: Random Sampling Simple

### ** Examples

library(forestmangr)
data("exfm2")
data("exfm3")
data("exfm4")

# The objective is to sample an area, with an error of 20%.
# First we run a pilot inventory, considering a 20% error and a finite population:
exfm3

sprs(exfm3, "VWB", "PLOT_AREA", "TOTAL_AREA", error = 20, pop = "fin")

# With these results, in order to obtain the desired error, we'll need to sample new 
# plots, and run the definitive inventory. Again, we aim for a 20% error, and consider
# the population as finite:
exfm4

sprs(exfm4, "VWB", "PLOT_AREA", "TOTAL_AREA", error = 20, pop = "fin")

# The desired error was met

# area values can be numeric
sprs(exfm4, "VWB", 3000, 46.8, error = 20, pop = "fin")

# Here we run a simple random sampling inventory for each forest subdivision,
# using the STRATA variable as a group variable:
exfm2

sprs(exfm2, "VWB", "PLOT_AREA", "STRATA_AREA",.groups = "STRATA" ,error = 20, pop = "fin")




