library(mistral)


### Name: testConvexity
### Title: Test the convexity of set of data
### Aliases: testConvexity

### ** Examples


# A limit state function
f <- function(x){  sqrt(sum(x^2)) - sqrt(2)/2 }

# Creation of the data sets
n <- 200
X <- matrix(runif(2*n), nrow = n)
Y <- apply(X, MARGIN = 1, function(w){sign(f(w))})

## Not run: 
##D   TEST.Convexity <- testConvexity(X, Y)
##D   if(length(TEST.Convexity) == 2){
##D     Convexity <- TEST.Convexity[[1]] 
##D     model.A   <- TEST.Convexity[[2]]
##D   }
##D   if(length(TEST.Convexity) == 1){
##D     # The problem is not convex
##D     Convexity <- 0 #the problem is not convex
##D   }
## End(Not run)




