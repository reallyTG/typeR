library(respirometry)


### Name: calc_MO2
### Title: Calculate metabolic rate
### Aliases: calc_MO2

### ** Examples

# get O2 data
file <- system.file('extdata', 'witrox_file.txt', package = 'respirometry')
o2_data <- na.omit(import_witrox(file, split_channels = TRUE)$CH_4)

# calculate MO2
(mo2_5_min <- calc_MO2(duration = o2_data$DURATION, o2 = o2_data$O2,
bin_width = 5, vol = 10, temp = o2_data$TEMP, sal = o2_data$SAL))

# what if measurements from the 10 to 12 minute marks can't be trusted?
bad_data = o2_data$DURATION >= 10 & o2_data$DURATION <= 12
(mo2_5_min <- calc_MO2(duration = o2_data$DURATION, o2 = o2_data$O2,
bin_width = 5, vol = 10, temp = o2_data$TEMP, sal = o2_data$SAL, good_data = !bad_data))

# easily make a Pcrit plot
plot(mo2_5_min$O2_MEAN, mo2_5_min$MO2)

# I want to express MO2 in mg per min instead.
(mo2_5_min$MO2 <- conv_resp_unit(value = mo2_5_min$MO2, from = 'umol_O2 / hr', to = 'mg_O2 / min'))

# just endpoint measurement:
calc_MO2(duration = o2_data$DURATION, o2 = o2_data$O2,
bin_width = Inf, vol = 10, temp = o2_data$TEMP, sal = o2_data$SAL)

# In my trial, observations above 77% air saturation were really noisy, but much less noisy at
# lower O2 values. I want to adjust my bin width based on the PO2 to obtain the best balance of
# resolution and precision throughout the whole trial. Below 77% a.s., use 4 minute bins. Above
# 77% a.s. use 10 minute bins.
bins = data.frame(o2 = c(77, 100), width = c(4, 10))
calc_MO2(duration = o2_data$DURATION, o2 = o2_data$O2,
bin_width = bins, vol = 10, temp = o2_data$TEMP, sal = o2_data$SAL)




