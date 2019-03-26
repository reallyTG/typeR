library(FIAR)


### Name: diffGranger
### Title: Directed conditional granger causality
### Aliases: diffGranger
### Keywords: ~Granger ~conditional

### ** Examples

# Example data with 5 regions x, y, z, q, w
head(grangerdata)

# Calculate AR() order of the data
ARorder(grangerdata, max=10)
 
# Compute difference conditional granger causality of region x to regions y o
# and z, conditional on regions q and w
F <- diffGranger(grangerdata, nx=1, ny=2, order=3)

# Compute F and bootstrap H0 distribution
F <- diffGranger(grangerdata, nx=1, ny=2, order=3, perm=TRUE, bs=50)



