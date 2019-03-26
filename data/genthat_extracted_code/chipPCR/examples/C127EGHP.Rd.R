library(chipPCR)


### Name: C127EGHP
### Title: qPCR Experiment for the Amplification of MLC-2v Using the Roche
###   Light Cycler 1.5
### Aliases: C127EGHP
### Keywords: datasets qPCR MLC-2v TaqMan

### ** Examples

str(C127EGHP)
data(C127EGHP)
tmp <- C127EGHP

par(mfrow = c(2,1))
plot(NA, NA, xlim = c(1,40), ylim = c(0,10), xlab = "Cycle", 
      ylab = "Fluorescence", main = "MLC-2v qPCR - EvaGreen")
  for (i in 3:34) {
    points(tmp[, 2], tmp[, i], type = "l", col = i)
  }

plot(NA, NA, xlim = c(1,40), ylim = c(0,10), xlab = "Cycle", 
      ylab = "Fluorescence", main = "MLC-2v qPCR - Hydrolysis probe")
  for (i in 35:66) {
    points(tmp[, 2], tmp[, i], type = "l", col = i)
  }
par(mfrow = c(1,1))



