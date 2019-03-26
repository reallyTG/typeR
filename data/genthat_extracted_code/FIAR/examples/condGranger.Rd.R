library(FIAR)


### Name: condGranger
### Title: Conditional granger causality
### Aliases: condGranger
### Keywords: ~Granger ~conditional

### ** Examples

# Example data with 5 regions x, y, z, q, w
head(grangerdata)

# Calculate AR() order of the data
ARorder(grangerdata,max=10)

# Compute conditional granger causality of region x (nx =1) to regions y and z (ny=2),
# conditional on regions q and w for an AR(3) model.
F <- condGranger(grangerdata,nx=1,ny=2,order=3)

# Compute F and permutation H0 distribution
F <- condGranger(grangerdata,nx=1,ny=2,order=3, perm=TRUE)



