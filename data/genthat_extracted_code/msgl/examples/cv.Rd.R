library(msgl)


### Name: cv
### Title: Cross Validation
### Aliases: cv

### ** Examples

data(SimData)

# A quick look at the data
dim(x)
table(classes)

# Setup clusters
cl <- makeCluster(2)
registerDoParallel(cl)

# Run cross validation using 2 clusters
# Using a lambda sequence ranging from the maximal lambda to 0.7 * maximal lambda
fit.cv <- msgl::cv(x, classes, alpha = 0.5, lambda = 0.7, use_parallel = TRUE)

# Stop clusters
stopCluster(cl)

# Print some information
fit.cv

# Cross validation errors (estimated expected generalization error)
# Misclassification rate
Err(fit.cv)

# Negative log likelihood error
Err(fit.cv, type="loglike")




