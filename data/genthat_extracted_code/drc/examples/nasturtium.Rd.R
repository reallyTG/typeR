library(drc)


### Name: nasturtium
### Title: Dose-response profile of degradation of agrochemical using
###   nasturtium
### Aliases: nasturtium
### Keywords: datasets

### ** Examples


nasturtium.m1 <- drm(weight~conc, data=nasturtium, fct = LL.3())

modelFit(nasturtium.m1)

plot(nasturtium.m1, type = "all", log = "", xlab = "Concentration (g/ha)", ylab = "Weight (mg)")



