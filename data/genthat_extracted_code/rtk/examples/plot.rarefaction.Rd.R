library(rtk)


### Name: plot
### Title: Plot rarfeaction results
### Aliases: rarefactioncurve plot plot.rtk

### ** Examples

require("rtk")
# generate semi sparse example data
data            <- matrix(sample(x = c(rep(0, 1500),rep(1:10, 500),1:1000),
                          size = 120, replace = TRUE), 40)
# find the column with the lowest aboundance
samplesize      <- min(colSums(data))
# rarefy the dataset, so each column contains the same number of samples
d1  <- rtk(input = data, depth = samplesize)
# rarefy to different depths between 1 and samplesize
d2  <- rtk(input = data, depth = round(seq(1, samplesize, length.out = 10)))

# just the richness of all three samples as boxplot
plot(d1, div = "richness")
#rarefaction curve for each sample with fit
plot(d2, div = "eveness", fit = "arrhenius", pch = c(1,2,3))
# Rarefaction curve with boxplot, sampels pooled together (grouped)
#plot(d2, div = "richness", fit = FALSE, boxplot = TRUE, col = 1, groups = rep(1, ncol(data)))




