library(asymmetry)


### Name: skewsymmetry
### Title: Decompose an Asymmetric Matrix into Symmetric and Skew-symmetric
###   Components
### Aliases: skewsymmetry
### Keywords: Methods

### ** Examples

data("Englishtowns")
Q <- skewsymmetry(Englishtowns)
# the skew-symmetric part
Q$A



