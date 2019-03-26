library(VFS)


### Name: MUSLE
### Title: Modified Universal Soil Loss Equation
### Aliases: MUSLE

### ** Examples


# Approximate erodibility factor from soil texture.
Kf <- MUSLE.K(.3, .5, .2)

# Calculate landscape factor from field size and shape.
# 100-m field length with 2% slope
# note that MUSLE.LS takes feet
LS <- MUSLE.LS(100 * 3.28, .02)

# assume 0.4 ha cornfield with known rainfall intensity
peakd <- peak(intensity = 55, area = 0.4)

SedYield <- MUSLE(85, qp = peakd, A = .4, K = Kf, LS = LS)




