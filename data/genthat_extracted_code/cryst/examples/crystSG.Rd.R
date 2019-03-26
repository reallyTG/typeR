library(cryst)


### Name: crystSG
### Title: Relative Crystallinity Calculation of X-Ray Diffraction Pattern
###   of Starch by Frost Method
### Aliases: crystSG

### ** Examples

data(XRD)
# Convert data frame to matrix, select A-type starch
pattern <- as.matrix(t(XRD[, c("Bragg_angle","A")]))
# List of crystallinity components
crs <- crystSG(pattern, N = 101, iter = 400, p = 2)
# Original matrix
original <- crs$original
# Background shape
background <- crs$background
# Curve of the crystalline starch
corrected <- crs$corrected
# Summary calculation of crystallinity
summary <- crs$summary



