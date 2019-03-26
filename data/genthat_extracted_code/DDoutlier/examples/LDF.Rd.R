library(DDoutlier)


### Name: LDF
### Title: Local Density Factor (LDF) algorithm with gaussian kernel
### Aliases: LDF
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Create dataset
X <- iris[,1:4]

# Find outliers by setting an optional range of k's
outlier_score <- LDF(dataset=X, k=10, h=2, c=1)$LDF

# Sort and find index for most outlying observations
names(outlier_score) <- 1:nrow(X)
sort(outlier_score, decreasing = TRUE)

# Inspect the distribution of outlier scores
hist(outlier_score)



