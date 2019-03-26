library(ChemoSpec2D)


### Name: plotSpectra2D
### Title: Plot a Spectra2D Object
### Aliases: plotSpectra2D
### Keywords: hplot

### ** Examples


data(MUD1)
mylvls <- seq(-0.3, 0.3, 0.1)[-4]
plotSpectra2D(MUD1, which = 7, lvls = mylvls,
  main = "MUD1 Sample 7")
plotSpectra2D(MUD1, which = c(1, 6), lvls = list(mylvls, mylvls),
  cols = list(rep("black", 6), rep("red", 6)),
  main = "MUD1 Sample 1 (black) & Sample 6 (red)")




