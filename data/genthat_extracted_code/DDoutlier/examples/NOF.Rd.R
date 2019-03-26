library(DDoutlier)


### Name: NOF
### Title: Natural Outlier Factor (NOF) algorithm
### Aliases: NOF
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Select dataset
X <- iris[,1:4]

# Run NOF algorithm
outlier_score <- NOF(dataset=X)$NOF

# Sort and find index for most outlying observations
names(outlier_score) <- 1:nrow(X)
sort(outlier_score, decreasing = TRUE)

# Inspect the distribution of outlier scores
hist(outlier_score)



