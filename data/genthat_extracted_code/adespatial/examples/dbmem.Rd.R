library(adespatial)


### Name: dbmem
### Title: dbMEM spatial eigenfunctions
### Aliases: dbmem

### ** Examples

if(require("ade4", quietly = TRUE) & require("adegraphics", quietly = TRUE)){

data(oribatid)
mite <- oribatid$fau      # 70 peat cores, 35 species
mite.xy <- oribatid$xy    # Geographic coordinates of the 70 cores

# Example 1: Compute the MEMs corresponding to all non-null eigenvalues
# thresh=1.012 is the value used in Borcard and Legendre (2002)
mite.dbmem1 <- dbmem(mite.xy, thresh=1.012, MEM.autocor = "non-null", silent = FALSE)
mite.dbmem1

# Print the (n-1) non-null eigenvalues
attributes(mite.dbmem1)$values
# or:  attr(mite.dbmem1, "values")

# Plot the associated spatial weighting matrix
s.label(mite.xy, nb = attr(mite.dbmem1, "listw"))

# Plot maps of the first 3 dbMEM eigenfunctions
s.value(mite.xy, mite.dbmem1[,1:3])

# Compute and test associated Moran's I values
# Eigenvalues are proportional to Moran's I

test <- moran.randtest(mite.dbmem1, nrepet = 99)
plot(test$obs, attr(mite.dbmem1, "values"), xlab = "Moran's I", ylab = "Eigenvalues")

# Decreasing values of Moran's I for the successive MEM.
# The red line is the expected value of Moran's I under H0.

plot(test$obs, xlab="MEM rank", ylab="Moran's I")
abline(h=-1/(nrow(mite.xy) - 1), col="red")

# Example 2: Compute only the MEMs with positive eigenvalues (and positive Moran's I)
mite.dbmem2 <- dbmem(mite.xy, thresh=1.012)
# or:  mite.dbmem2 <- dbmem(dist(mite.xy), thresh=1.012, silent=FALSE)
mite.dbmem2

# Examine the eigenvalues
attributes(mite.dbmem2)$values
# or:  attr(mite.dbmem2, "values")

# Examine (any portion of) the dbmem spatial eigenvectors
tmp <- as.matrix(mite.dbmem2)
tmp[1:10,1:6]
}




