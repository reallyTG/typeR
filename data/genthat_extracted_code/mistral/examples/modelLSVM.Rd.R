library(mistral)


### Name: modelLSVM
### Title: Estimation of the parameters of the LSVM
### Aliases: modelLSVM

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
## End(Not run)




