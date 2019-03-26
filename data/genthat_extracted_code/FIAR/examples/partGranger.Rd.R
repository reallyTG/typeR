library(FIAR)


### Name: partGranger
### Title: Partial Granger causality
### Aliases: partGranger
### Keywords: ~Granger ~parial

### ** Examples

# Example data with 5 regions x, y, z, q, w
head(grangerdata)

# Calculate AR() order of the data
ARorder(grangerdata, max=10)
 
# Compute partial conditional granger causality of region x to regions y 
# and z, conditional on regions q and w
F <- partGranger(grangerdata, nx=1, ny=2, order=3)

# Compute F and permutation H0 distribution
F <- partGranger(grangerdata, nx=1, ny=2, order=3, perm=TRUE,bs=10)



