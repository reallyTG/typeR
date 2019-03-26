library(DDoutlier)


### Name: INFLO
### Title: Influenced Outlierness (INFLO) algorithm
### Aliases: INFLO
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Create dataset
X <- iris[,1:4]

# Find outliers by setting an optional k
outlier_score <- INFLO(dataset=X, k=10)

# Sort and find index for most outlying observations
names(outlier_score) <- 1:nrow(X)
sort(outlier_score, decreasing = TRUE)

# Inspect the distribution of outlier scores
hist(outlier_score)



