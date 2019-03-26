library(DDoutlier)


### Name: LOF
### Title: Local Outlier Factor (LOF) algorithm
### Aliases: LOF
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Create dataset
X <- iris[,1:4]

# Find outliers by setting an optional k
outlier_score <- LOF(dataset=X, k=10)

# Sort and find index for most outlying observations
names(outlier_score) <- 1:nrow(X)
sort(outlier_score, decreasing = TRUE)

# Inspect the distribution of outlier scores
hist(outlier_score)



