library(DDoutlier)


### Name: NAN
### Title: Natural Neighbor (NAN) algorithm to return the self-adaptive
###   neighborhood
### Aliases: NAN
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Select dataset
X <- iris[,1:4]

# Identify the right k-parameter
K <- NAN(X, NaN_Edges=FALSE)$r

# Use the k-setting in an abitrary outlier detection algorithm
outlier_score <- LOF(dataset=X, k=K)

# Sort and find index for most outlying observations
names(outlier_score) <- 1:nrow(X)
sort(outlier_score, decreasing = TRUE)

# Inspect the distribution of outlier scores
hist(outlier_score)



