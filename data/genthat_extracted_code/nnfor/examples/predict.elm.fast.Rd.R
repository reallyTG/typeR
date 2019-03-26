library(nnfor)


### Name: predict.elm.fast
### Title: Predictions for ELM (fast) network.
### Aliases: predict.elm.fast
### Keywords: elm

### ** Examples

## Don't show: 
 p <- 2000
 n <- 150
 X <- matrix(rnorm(p*n),nrow=n)
 b <- cbind(rnorm(p))
 Y <- X %*% b
 fit <- elm.fast(Y,X,reps=1)
 predict(fit,X)
## End(Don't show)
## Not run: 
##D  p <- 2000
##D  n <- 150
##D  X <- matrix(rnorm(p*n),nrow=n)
##D  b <- cbind(rnorm(p))
##D  Y <- X %*% b
##D  fit <- elm.fast(Y,X)
##D  predict(fit,X)
## End(Not run)




