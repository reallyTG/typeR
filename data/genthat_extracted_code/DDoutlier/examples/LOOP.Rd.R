library(DDoutlier)


### Name: LOOP
### Title: Local Outlier Probability (LOOP) algorithm
### Aliases: LOOP
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Create dataset
X <- iris[,1:4]

# Find outliers by setting an optional k
outlier_score <- LOOP(dataset=X, k=10, lambda=3)

# Sort and find index for most outlying observations
names(outlier_score) <- 1:nrow(X)
sort(outlier_score, decreasing = TRUE)

# Inspect the distribution of outlier scores
hist(outlier_score)



