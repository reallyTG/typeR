library(msgl)


### Name: subsampling
### Title: Multinomial sparse group lasso generic subsampling procedure
### Aliases: subsampling

### ** Examples

data(SimData)

# A quick look at the data
dim(x)
table(classes)

test <- list(1:20, 21:40)
train <- lapply(test, function(s) (1:length(classes))[-s])

# Run subsampling
# Using a lambda sequence ranging from the maximal lambda to 0.5 * maximal lambda
fit.sub <- msgl::subsampling(x, classes, alpha = 0.5, lambda = 0.5, training = train, test = test)

# Print some information
fit.sub

# Mean misclassification error of the tests
Err(fit.sub)

# Negative log likelihood error
Err(fit.sub, type="loglike")




