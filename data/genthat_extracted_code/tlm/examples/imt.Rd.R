library(tlm)


### Name: imt
### Title: Intima Media Thickness of the Carotid Artery
### Aliases: imt
### Keywords: datasets

### ** Examples

data(imt)
par(las = 1, mfrow = c(1, 2))
with(imt, plot(age, imt))
with(imt, plot(age, logimt))



