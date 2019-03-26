library(spftir)


### Name: spmblp
### Title: Polynomial Baseline Correction of a Matrix of Mid-infrared
###   Spectra
### Aliases: spmblp

### ** Examples

data(spData)
# Convert data frame to matrix
spectra <- as.matrix(t(spData))
# List of polynomial baseline components
mblp <- spmblp(spectra, degree = 2, tol = 0.001, rep = 100)
# Original matrix
original <- mblp$original
# Baseline matrix
baseline <- mblp$baseline
# Corrected matrix
corrected <- mblp$corrected



