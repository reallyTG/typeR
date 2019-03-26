library(DDoutlier)


### Name: KDEOS
### Title: Kernel Density Estimation Outlier Score (KDEOS) algorithm with
###   gaussian kernel
### Aliases: KDEOS
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Create dataset
X <- iris[,1:4]

# Find outliers by setting an optional range of k's
outlier_score <- KDEOS(dataset=X, k_min=10, k_max=15)

# Sort and find index for most outlying observations
names(outlier_score) <- 1:nrow(X)
sort(outlier_score, decreasing = TRUE)

# Inspect the distribution of outlier scores
hist(outlier_score)



