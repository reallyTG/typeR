library(sleepr)


### Name: bout_analysis
### Title: Find "bouts" in categorical time series
### Aliases: bout_analysis

### ** Examples

# Bout analysis on binary variable:
dt <- toy_dam_data()
dt[, moving := activity > 0]
bdt <- bout_analysis(moving,dt)
print(bdt)
# With multiple states
dt <- toy_ethoscope_data()
# we discretise x position in three states: left, middle and right (1/3 each)
dt[, location := as.character( cut(x,
                               breaks = c(0.0, .33, .67, 1.0),
                               labels = c("left", "middle", "right")))]

bdt <- bout_analysis(location, dt)



