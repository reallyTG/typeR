library(PCRedux)


### Name: encu
### Title: A function to calculate numerous features from amplification
###   curve data from a quantitative PCR experiment.
### Aliases: encu
### Keywords: intercept normalization preprocessing slope

### ** Examples


# Calculate curve features of an amplification curve data. Note that not all
# available CPU cores are used. If need set "all" to use all available cores.
# In this example the testdat data set from the qpcR package is used.
# The samples F1.1 and F1.2 are positive amplification curves. The samples
# F1.3 and F1.4 are negative.

library(qpcR)
res_encu <- encu(testdat[, 1:3])
res_encu




