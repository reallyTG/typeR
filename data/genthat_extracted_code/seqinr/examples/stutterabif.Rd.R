library(seqinr)


### Name: stutterabif
### Title: Stutter ratio estimation
### Aliases: stutterabif

### ** Examples

  #
  # Load pre-defined dataset, same as what would be obtained with read.abif:
  #

data(JLO)

  #
  # Get peak locations in the blue channel:
  #

maxis <- peakabif(JLO, 1, npeak = 6, tmin = 3, fig = FALSE)$maxis

  #
  # Compute stutter ratio for first peak and ask for a figure:
  #

tmp <- stutterabif(JLO, 1, maxis[1], fig = TRUE)

  #
  # Show in addition the normal approximation used at the stutter peak:
  #

xx <- seq(tmp$p$mu1 - 6*tmp$p$sd1, tmp$p$mu1 + 6*tmp$p$sd1, le = 100)
lines(xx, tmp$p$p1*dnorm(xx, tmp$p$mu1, tmp$p$sd1), col = "darkgreen")

  #
  # Show in addition the normal approximation used at allele peak:
  #

xx <- seq(tmp$p$mu2 - 6*tmp$p$sd2, tmp$p$mu2 + 6*tmp$p$sd2, le = 100)
lines(xx, tmp$p$p2*dnorm(xx, tmp$p$mu2, tmp$p$sd2), col = "darkgreen")



