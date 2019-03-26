library(FIAR)


### Name: pdiffGranger
### Title: partial difference Granger causality
### Aliases: pdiffGranger
### Keywords: ~Granger ~partial

### ** Examples

# Example data with 5 regions x, y, z, q, w
head(grangerdata)

# Calculate AR() order of the data
ARorder(grangerdata, max=10)
 
# Compute partial difference conditional Granger causality of region x to 
# regions y and z, conditional on regions q and w
F <- pdiffGranger(grangerdata, nx=1, ny=2, order=3)

# Compute F and permutation H0 distribution
F <- pdiffGranger(grangerdata, nx=1, ny=2, order=3, perm=TRUE, bs=50)



