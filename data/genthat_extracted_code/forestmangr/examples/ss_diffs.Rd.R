library(forestmangr)


### Name: ss_diffs
### Title: Systematic Sampling
### Aliases: ss_diffs
### Keywords: Sampling Systematic

### ** Examples

library(forestmangr)
data("exfm2")
data("exfm5")

# We're trying to run a inventory for an area This data was collected systematically,
# but we'll try to run the data using simple random sampling, 
# to show the difference between the two methods:
exfm5

sprs(exfm5, "VWB", "PLOT_AREA", "TOTAL_AREA")

# We get a 22% error value. Now, we run this same data
# considering the data as a systematic inventory, using the
# successive differences method:
exfm5

ss_diffs(exfm5, "VWB", "PLOT_AREA", "TOTAL_AREA")

# The error was significantly lowered.

# Area Values can be numeric;
ss_diffs(exfm5, "VWB", 200, 18)

# Here we run a systematic sampling inventory for each forest subdivision, 
# using the STRATA variable as a group variable:
exfm2

ss_diffs(exfm2, "VWB", "PLOT_AREA", "STRATA_AREA",.groups = "STRATA")




