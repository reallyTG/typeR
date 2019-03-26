library(adespatial)


### Name: dist.ldc
### Title: Dissimilarity matrices for community composition data
### Aliases: dist.ldc

### ** Examples


if(require("vegan", quietly = TRUE)) {
data(mite)
mat1  = as.matrix(mite[1:10, 1:15])   # No column has a sum of 0
mat2 = as.matrix(mite[61:70, 1:15])   # 7 of the 15 columns have a sum of 0

#Example 1: compute Hellinger distance for mat1
D.out = dist.ldc(mat1,"hellinger")

#Example 2: compute chi-square distance for mat2
D.out = dist.ldc(mat2,"chisquare")

#Example 3: compute percentage difference dissimilarity for mat2
D.out = dist.ldc(mat2,"percentdiff")

}





