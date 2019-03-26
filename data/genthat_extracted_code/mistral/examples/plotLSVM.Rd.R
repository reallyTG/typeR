library(mistral)


### Name: plotLSVM
### Title: plot of LSVM
### Aliases: plotLSVM

### ** Examples


# A limit state function
f <- function(x){  sqrt(sum(x^2)) - sqrt(2)/2 }

# Creation of the data sets

n <- 200
X <- matrix(runif(2*n), nrow = n)
Y <- apply(X, MARGIN = 1, function(w){sign(f(w))})

## Not run: 
##D   model.A <- modelLSVM(X,Y, convexity = -1)
##D   plotLSVM(X, Y, model.A, hyperplanes = FALSE, limit.state.estimate = TRUE, convexity = -1)
## End(Not run)




