library(mistral)


### Name: LSVM
### Title: Linear Support Vector Machine under monotonicity constraints
### Aliases: LSVM

### ** Examples

# A limit state function
f <- function(x){  sqrt(sum(x^2)) - sqrt(2)/2 }

# Creation of the data sets
n <- 200
X <- matrix(runif(2*n), nrow = n)
Y <- apply(X, MARGIN = 1, function(w){sign(f(w))})

#The convexity is known
## Not run: 
##D   model.A <- modelLSVM(X, Y, convexity = -1)
##D   m <- 10
##D   X.test <- matrix(runif(2*m), nrow = m)
##D   classOf.X.test <- LSVM(X.test, model.A, convexity = -1)
## End(Not run)




