library(DDoutlier)


### Name: DB
### Title: Distance-based outlier detection based on user-given
###   neighborhood size
### Aliases: DB
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Create dataset
X <- iris[,1:4]

# Classify observations
cls_observations <- DB(dataset=X, d=1, fraction=0.05)$classification

# Remove outliers from dataset
X <- X[cls_observations=='Inlier',]



