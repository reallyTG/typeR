library(nFactors)


### Name: eigenBootParallel
### Title: Bootstrapping of the Eigenvalues From a Data Frame
### Aliases: eigenBootParallel
### Keywords: multivariate

### ** Examples

# .......................................................
# Example from the iris data
 eigenvalues <- eigenComputes(x=iris[,-5])
 
# Permutation parallel analysis distribution
 aparallel   <- eigenBootParallel(x=iris[,-5], quantile=0.95)$quantile

# Number of components to retain
 results     <- nScree(x = eigenvalues, aparallel = aparallel)
 results$Components
 plotnScree(results)
# ......................................................

# ......................................................
# Bootstrap distributions study of the eigenvalues from iris data
# with different correlation methods
 eigenBootParallel(x=iris[,-5],quantile=0.05,
                   option="bootstrap",method="pearson")
 eigenBootParallel(x=iris[,-5],quantile=0.05,
                   option="bootstrap",method="spearman")
 eigenBootParallel(x=iris[,-5],quantile=0.05,
                   option="bootstrap",method="kendall")
 


