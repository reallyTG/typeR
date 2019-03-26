library(equate)


### Name: plot.freqtab
### Title: Plotting Frequency Distributions
### Aliases: plot.freqtab points.freqtab bfreqplot ufreqplot points.freqtab
### Keywords: misc

### ** Examples


x <- freqtab(KBneat$x, scales = list(0:36, 0:12))
plot(x)

xs <- loglinear(x, degrees = c(4, 1),
  stepup = TRUE, showWarnings = FALSE)
plot(x, xs, lwd = 2)




