library(RSEIS)


### Name: plotarrivals
### Title: plot theoretical arrival times for a seismic section
### Aliases: plotarrivals
### Keywords: misc

### ** Examples


S1 <- symshot1()

wiggleimage(S1$smograms  , dt=(-S1$dt), dx=S1$dx)

plotarrivals(S1$x, S1$THEORY, add = TRUE)






