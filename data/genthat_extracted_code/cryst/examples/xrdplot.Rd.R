library(cryst)


### Name: xrdplot
### Title: Plots the Crystalline Area of a X-Ray Diffraction Pattern of
###   Starch
### Aliases: xrdplot

### ** Examples

# Convert data frame to matrix, select A-type starch
pattern <- as.matrix(t(XRD[, c("Bragg_angle","A")]))
# List of crystallinity components
crs <- crystMW(pattern, N = 11, iter = 100)
# Original matrix
original <- crs$original
# Background shape
background <- crs$background
# Plots the crystalline area of a XRD pattern
xrdplot(pattern=original, background=background)



