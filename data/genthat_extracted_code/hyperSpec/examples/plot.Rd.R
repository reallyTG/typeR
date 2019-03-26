library(hyperSpec)


### Name: plot-methods
### Title: Plotting hyperSpec Objects
### Aliases: plot-methods plot plot,ANY,ANY-method
###   plot,hyperSpec,character-method plot,hyperSpec,missing-method
###   plot,hyperSpec,character-method
### Keywords: hplot methods

### ** Examples


plot (flu)

plot (flu, "c")

plot (laser, "ts")

spc <- apply (chondro, 2, quantile, probs = 0.05)
spc <- sweep (chondro, 2, spc, "-")
plot (spc, "spcprctl5")
plot (spc, "spcprctile")
plot (spc, "spcmeansd")




