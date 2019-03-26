library(DDoutlier)


### Name: LOCI
### Title: Local Correlation Integral (LOCI) algorithm with constant
###   nearest neighbor parameter
### Aliases: LOCI
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Create dataset
X <- iris[,1:4]

# Classify observations
cls_observations <- LOCI(dataset=X, alpha=0.5, nn=20, k=1)$class

# Remove outliers from dataset
X <- X[cls_observations=='Inlier',]



