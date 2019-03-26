library(HH)


### Name: hov
### Title: Homogeneity of Variance
### Aliases: hov hov.bf
### Keywords: models

### ** Examples

data(turkey)

hov(wt.gain ~ diet, data=turkey)
hovPlot(wt.gain ~ diet, data=turkey)



