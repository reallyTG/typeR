library(ChemoSpec2D)


### Name: removePeaks2D
### Title: Remove Peaks in a Spectra2D Object
### Aliases: removePeaks2D
### Keywords: utilities

### ** Examples

# Note we will set contours a bit low to better
# show what is going on.

data(MUD1)
mylvls <- seq(-0.3, 0.3, 0.1)
mylvls[4] <- 0.05

plotSpectra2D(MUD1, which = 7, lvls = mylvls,
  main = "MUD1 Sample 7: Complete Data Set")

MUD1a <- removePeaks2D(MUD1, remF2 = 2.5 ~ 4)
sumSpectra(MUD1a)
plotSpectra2D(MUD1a, which = 7, lvls = mylvls,
  main = "MUD1 Sample 7\nRemoved Peaks: F2 2.5 ~ 4")

MUD1b <- removePeaks2D(MUD1, remF2 = low ~ 5)
sumSpectra(MUD1b)
plotSpectra2D(MUD1b, which = 7, lvls = mylvls,
  main = "MUD1 Sample 7\nRemoved Peaks: F2 low ~ 5")

MUD1c <- removePeaks2D(MUD1, remF1 = high ~ 23)
sumSpectra(MUD1c)
plotSpectra2D(MUD1c, which = 7, lvls = mylvls,
  main = "MUD1 Sample 7\nRemoved Peaks: F1 high ~ 23")

MUD1d <- removePeaks2D(MUD1, remF2 = 2.5 ~ 4, remF1 = 17 ~ 20)
sumSpectra(MUD1d)
plotSpectra2D(MUD1d, which = 7, lvls = mylvls,
  main = "MUD1 Sample 7\nRemoved Peaks: F2 2.5 ~ 4 & F1 17 ~ 20")




