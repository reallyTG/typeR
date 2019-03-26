library(GPareto)


### Name: plotSymDifRNP
### Title: Symmetrical difference of RNP sets
### Aliases: plotSymDifRNP

### ** Examples

#------------------------------------------------------------
# Simple example
#------------------------------------------------------------
set1 <- rbind(c(0.2, 0.35, 0.5, 0.8),
              c(0.8, 0.6, 0.55, 0.3))

set2 <- rbind(c(0.3, 0.4),
              c(0.7, 0.4))

plotSymDifRNP(set1, set2, xlim = c(0, 1), ylim = c(0, 1), fill = "grey")
points(t(set1), col = "red", pch = 20)
points(t(set2), col = "blue", pch = 20)



