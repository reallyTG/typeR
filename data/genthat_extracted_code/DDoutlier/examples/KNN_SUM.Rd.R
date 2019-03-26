library(DDoutlier)


### Name: KNN_SUM
### Title: Sum of distance to k-nearest neighbors
### Aliases: KNN_SUM
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Create dataset and set an optional k
X <- iris[,1:4]
K <- 5

# Find outliers
outlier_score <- KNN_SUM(dataset=X, k=K)

# Sort and find index for most outlying observations
names(outlier_score) <- 1:nrow(X)
sort(outlier_score, decreasing = TRUE)

# Inspect the distribution of outlier scores
hist(outlier_score)



