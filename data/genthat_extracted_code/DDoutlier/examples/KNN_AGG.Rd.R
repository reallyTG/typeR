library(DDoutlier)


### Name: KNN_AGG
### Title: Aggregated k-nearest neighbors distance over different k's
### Aliases: KNN_AGG
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Create dataset
X <- iris[,1:4]

# Find outliers by setting a range of k's
outlier_score <- KNN_AGG(dataset=X, k_min=10, k_max=15)

# Sort and find index for most outlying observations
names(outlier_score) <- 1:nrow(X)
sort(outlier_score, decreasing = TRUE)

# Inspect the distribution of outlier scores
hist(outlier_score)



