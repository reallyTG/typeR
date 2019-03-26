library(Renvlp)


### Name: boot.genv
### Title: Bootstrap for genv
### Aliases: boot.genv

### ** Examples

data(fiberpaper)
X <- fiberpaper[ , c(5, 7)]
Y <- fiberpaper[ , 1:3]
Z <- as.numeric(fiberpaper[ , 6] > mean(fiberpaper[ , 6]))

B <- 100
## Not run: res <- boot.genv(X, Y, Z, 2, B)
## Not run: res$bootse[[1]]
## Not run: res$bootse[[2]]




