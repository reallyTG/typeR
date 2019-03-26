library(cryst)


### Name: crystMW
### Title: Relative Crystallinity Calculation of X-Ray Diffraction Pattern
###   of Starch by Bruckner Method
### Aliases: crystMW

### ** Examples

data(XRD)
# Convert data frame to matrix, select A-type starch
pattern <- as.matrix(t(XRD[,c("Bragg_angle","A")]))
# List of crystallinity components
crs <- crystMW(pattern, N = 41, iter = 100)
# Original matrix
original <- crs$original
# Background shape
background <- crs$background
# Curve of the crystalline starch
corrected <- crs$corrected
# Summary calculation of crystallinity
summary <- crs$summary



