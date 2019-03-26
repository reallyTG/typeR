library(msgl)


### Name: Err.msgl
### Title: Compute error rates
### Aliases: Err.msgl

### ** Examples

data(SimData)

x.all <- x
x.1 <- x[1:50,]
x.2 <- x[51:100,]
classes.all <- classes
classes.1 <- classes[1:50]
classes.2 <- classes[51:100]

#### Fit models using x.1
lambda <- msgl::lambda(x.1, classes.1, alpha = .5, d = 25, lambda.min = 0.075)
fit <- msgl::fit(x.1, classes.1, alpha = .5, lambda = lambda)

#### Training errors:

# Misclassification rate
Err(fit, x.1)

# Misclassification count
Err(fit, x.1, type = "count")

# Negative log likelihood error
Err(fit, x.1, type="loglike")

# Misclassification rate of x.2
Err(fit, x.2, classes.2)

#### Do cross validation
fit.cv <- msgl::cv(x.all, classes.all, alpha = .5, lambda = lambda)

#### Cross validation errors (estimated expected generalization error)

# Misclassification rate
Err(fit.cv)

# Negative log likelihood error
Err(fit.cv, type="loglike")

#### Do subsampling
test <- list(1:20, 21:40)
train <- lapply(test, function(s) (1:length(classes.all))[-s])

fit.sub <- msgl::subsampling(x.all, classes.all, alpha = .5,
 lambda = lambda, training = train, test = test)

# Mean misclassification error of the tests
Err(fit.sub)

# Negative log likelihood error
Err(fit.sub, type="loglike")




