library(msgl)


### Name: print.msgl
### Title: Print function for msgl
### Aliases: print.msgl

### ** Examples

data(SimData)

### Estimation
lambda <- msgl::lambda(x, classes, alpha = .5, d = 25, lambda.min = 0.075)
fit <- msgl::fit(x, classes, alpha = .5, lambda = lambda)

# Print some information about the estimated models
fit

### Cross validation
fit.cv <- msgl::cv(x, classes, alpha = .5, lambda = lambda)

# Print some information
fit.cv

### Subsampling
test <- list(1:20, 21:40)
train <- lapply(test, function(s) (1:length(classes))[-s])

lambda <- msgl::lambda(x, classes, alpha = .5, d = 50, lambda.min = 0.05)
fit.sub <- msgl::subsampling(x, classes, alpha = .5, lambda = lambda, training = train, test = test)

# Print some information
fit.sub




