library(crqa)


### Name: drpdfromts
### Title: Cross-Recurrence diagonal profile of two time-series
### Aliases: drpdfromts

### ** Examples


data(crqa)

res = drpdfromts(RDts1, RDts2, ws = 100,
datatype = "categorical", radius = 0.001, 
delay = 1, embed = 1, rescale = 0, normalize = 0, 
mindiagline = 2, minvertline = 2, tw = 0)

profile = res$profile

plot(seq(1,length(profile),1), profile, type = "l", lwd = 5,
     xaxt = "n", xlab = "Lag", ylab = "Recurrence")




