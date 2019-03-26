library(robfilter)


### Name: wrm.smooth
### Title: Weighted Repeated Median Smoothing
### Aliases: wrm.smooth
### Keywords: smooth robust

### ** Examples

data(faithful) # Old Faithful Geyser data
faith.WRM <- wrm.smooth(faithful$w, faithful$e,h=4)
plot(faith.WRM)



