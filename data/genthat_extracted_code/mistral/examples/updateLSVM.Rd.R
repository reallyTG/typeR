library(mistral)


### Name: updateLSVM
### Title: Update LSVM classifier
### Aliases: updateLSVM

### ** Examples


# A limit state function
f <- function(x){  sqrt(sum(x^2)) - sqrt(2)/2 }

# Creation of the data sets

n <- 200
X <- matrix(runif(2*n), nrow = n)
Y <- apply(X, MARGIN = 1, function(w){sign(f(w))})

## Not run: 
##D   model.A <- modelLSVM(X,Y, convexity = -1)
##D   M <- 20
##D   X.new <- matrix(runif(2*M), nrow = M)
##D   Y.new <- apply(X.new, MARGIN = 1, function(w){ sign(f(w))})
##D 
##D   X.new.S <- X.new[which(Y.new > 0), ]
##D   Y.new.S <- Y.new[which(Y.new > 0)]
##D   model.A.new <- updateLSVM(X.new.S, Y.new.S, X, Y,
##D                             model.A, convexity = -1, PLOTSVM = TRUE, step.plot.LSVM = 5)
## End(Not run)




