library(DDoutlier)


### Name: KNN_IN
### Title: In-degree for observations in a k-nearest neighbors graph
### Aliases: KNN_IN
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Create dataset
X <- iris[,1:4]

# Find outliers by setting an optional k
outlier_score <- KNN_IN(dataset=X, k=10)

# Sort and find index for most outlying observations
names(outlier_score) <- 1:nrow(X)
sort(outlier_score, decreasing = FALSE)

# Inspect the distribution of outlier scores
hist(outlier_score)



