library(rIsing)


### Name: logreg
### Title: L1 Regularized Logistic Regression
### Aliases: logreg

### ** Examples

# simulate some linear regression data
n <- 1e3
p <- 100
X <- matrix(rnorm(n*p),n,p)
wt <- sample(seq(0,9),p+1,replace = TRUE) / 10
z <- cbind(1,X) %*% wt + rnorm(n)
probs <- 1 / (1 + exp(-z))
y <- sapply(probs, function(p) rbinom(1,1,p))

m1 <- logreg(X, y)
m2 <- logreg(X, y, nlambda = 100, lambda.min.ratio = 1e-4, type = 1)

## Not run: 
##D # Performance comparison
##D library(glmnet)
##D library(microbenchmark)
##D nlambda = 50; lambda.min.ratio = 1e-3
##D microbenchmark(
##D   logreg_type1 = logreg(X, y, nlambda = nlambda,
##D                          lambda.min.ratio = lambda.min.ratio, type = 1),
##D   logreg_type2 = logreg(X, y, nlambda = nlambda,
##D                          lambda.min.ratio = lambda.min.ratio, type = 2),
##D   glmnet       = glmnet(X, y, family = "binomial",
##D                          nlambda = nlambda, lambda.min.ratio = lambda.min.ratio),
##D   times = 20L
##D )
## End(Not run)




