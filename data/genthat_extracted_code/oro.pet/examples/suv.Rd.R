library(oro.pet)


### Name: leanBodyMass
### Title: Calculating the Lean Body Mass
### Aliases: leanBodyMass 'Summarizing SUVs' hotSpotSUV totalSUV

### ** Examples

library(oro.pet)
n <- 11
h <- seq(200, 150, length=n)
w <- seq(80, 120, length=n)
cbind(h, w, leanBodyMass(h, w, "male"), leanBodyMass(h, w, "female"))



