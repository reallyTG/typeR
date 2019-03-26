library(DDoutlier)


### Name: RKOF
### Title: Robust Kernel-based Outlier Factor (RKOF) algorithm with
###   gaussian kernel
### Aliases: RKOF
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Create dataset
X <- iris[,1:4]

# Find outliers by setting an optional k
outlier_score <- RKOF(dataset=X, k = 10, C = 1, alpha = 1, sigma2 = 1)

# Sort and find index for most outlying observations
names(outlier_score) <- 1:nrow(X)
sort(outlier_score, decreasing = TRUE)

# Inspect the distribution of outlier scores
hist(outlier_score)



