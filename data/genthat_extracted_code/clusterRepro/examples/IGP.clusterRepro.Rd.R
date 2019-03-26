library(clusterRepro)


### Name: IGP.clusterRepro
### Title: In-group proportion calculation
### Aliases: IGP.clusterRepro
### Keywords: univar

### ** Examples

### Make centroid matrix with annotated rows
C <- matrix(rnorm(30), 10)
rownames(C) <- letters[1:nrow(C)]

### Make data matrix with annotated rows
D <- matrix(rnorm(100), 10)
rownames(D) <- letters[1:nrow(C)]

### Classify data and calculate in-group proportions
Result <- IGP.clusterRepro(D, C)

### If the number of rows in the centroid matrix does not match the
### number of rows in the data matrix and the row labels are unique, this
### function will only use the rows that the two matrices have in common.
D <- matrix(rnorm(200), 20)
rownames(D) <- letters[(nrow(D)+6):7]
Result <- IGP.clusterRepro(D, C)




