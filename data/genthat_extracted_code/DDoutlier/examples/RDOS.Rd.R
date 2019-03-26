library(DDoutlier)


### Name: RDOS
### Title: Relative Density-based Outlier Factor (RDOS) algorithm with
###   gaussian kernel
### Aliases: RDOS
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Create dataset
X <- iris[,1:4]

# Find outliers by setting an optional k
outlier_score <- RDOS(dataset=X, k=10, h=2)

# Sort and find index for most outlying observations
names(outlier_score) <- 1:nrow(X)
sort(outlier_score, decreasing = TRUE)

# Inspect the distribution of outlier scores
hist(outlier_score)



