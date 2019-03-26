library(respirometry)


### Name: make_bins
### Title: Make time bins for MO2 calculations
### Aliases: make_bins

### ** Examples

# get O2 data
file <- system.file('extdata', 'witrox_file.txt', package = 'respirometry')
o2_data <- na.omit(import_witrox(file, split_channels = TRUE)$CH_4)

# Total trial duration is 21.783 minutes

make_bins(o2 = o2_data$O2, duration = o2_data$DURATION) # creates the default 10 bins. At the
# highest O2 levels, bin widths are 21.783/10 = 2.1783 mins and at the lowest O2 levels, bin
# widths are 0.21783 mins.

bins <- make_bins(o2 = o2_data$O2, duration = o2_data$DURATION, min_o2_width = 1/20,
max_o2_width = 1/3, n_bins = 5) # creates 5 bins. At the highest O2 levels, bin widths are
# 21.783/3 = 7.261 mins and at the lowest O2 levels, bin widths are 21.783/20 = 1.089 mins.

(mo2 <- calc_MO2(duration = o2_data$DURATION, o2 = o2_data$O2,
bin_width = bins, vol = 10, temp = o2_data$TEMP, sal = o2_data$SAL))




