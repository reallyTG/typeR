library(qle)


### Name: multiDimLHS
### Title: Multidimensional Latin Hypercube Sampling (LHS) generation
### Aliases: multiDimLHS

### ** Examples

data(normal)
# generate a design
X <- multiDimLHS(N=5,qsd$lower,qsd$upper,type="matrix")

# augment design X 
rbind(X,multiDimLHS(N=1,qsd$lower,qsd$upper,X=X,
				method="augmentLHS",type="matrix"))





