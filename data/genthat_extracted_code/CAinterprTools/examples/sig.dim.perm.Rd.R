library(CAinterprTools)


### Name: sig.dim.perm
### Title: Permuted significance of CA dimensions
### Aliases: sig.dim.perm
### Keywords: sig.dim.perm

### ** Examples

data(greenacre_data)

#Returns a scatterplot of the permuted inertia of the 1 CA dimension
#against the permuted inertia of the 2 CA dimension.
#The observed inertia of the selected dimensions is also displayed as a large red dot; 
#pvalues are reported in the axes labels.
sig.dim.perm(greenacre_data, 1,2)




