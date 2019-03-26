library(baytrends)


### Name: [.lcens
### Title: Subset an Object
### Aliases: [.lcens [.mcens [.qw subset.qw [.mcens [.qw subset.qw
### Keywords: internal manip

### ** Examples

Xcens <- as.lcens(c(1, 2, 3, 4), 2)
# Extract the 3rd value
Xcens[3]
# Change the 3rd value to NA and print the data
Xcens[3,] <- NA
Xcens



