library(nnfor)


### Name: elm.fast
### Title: ELM (fast) neural network.
### Aliases: elm.fast
### Keywords: mlp thief ts

### ** Examples

## Don't show: 
 p <- 2000
 n <- 150
 X <- matrix(rnorm(p*n),nrow=n)
 b <- cbind(rnorm(p))
 Y <- X %*% b
 fit <- elm.fast(Y,X,reps=1)
 print(fit)
## End(Don't show)
## Not run: 
##D  p <- 2000
##D  n <- 150
##D  X <- matrix(rnorm(p*n),nrow=n)
##D  b <- cbind(rnorm(p))
##D  Y <- X %*% b
##D  fit <- elm.fast(Y,X)
##D  print(fit)
## End(Not run)




