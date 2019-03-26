library(sda)


### Name: centroids
### Title: Group Centroids and (Pooled) Variances
### Aliases: centroids
### Keywords: multivariate

### ** Examples

# load sda library
library("sda")

## prepare data set
data(iris) # good old iris data
X = as.matrix(iris[,1:4])
Y = iris[,5]

## estimate centroids and empirical pooled variances
centroids(X, Y, lambda.var=0)
          
## also compute group-specific variances
centroids(X, Y, var.groups=TRUE, lambda.var=0)
   
## use shrinkage estimator for the variances
centroids(X, Y, var.groups=TRUE)

## return centered data
xc = centroids(X, Y, centered.data=TRUE)$centered.data
apply(xc, 2, mean)

## useful, e.g., to compute the inverse pooled correlation matrix
powcor.shrink(xc, alpha=-1)



