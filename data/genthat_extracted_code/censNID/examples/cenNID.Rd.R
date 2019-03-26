library(censNID)


### Name: cenNID
### Title: mle estimation for censored normal
### Aliases: cenNID
### Keywords: htest models

### ** Examples

set.seed(32173217)
n<-100
z <- rnorm(n)
U <- rep(Inf, n)
L <- rep(-Inf, n)
cy <- -1
ind <- z > cy
m <- sum(as.integer(ind))
y <- c(z[ind], rep(cy, n-m))
L[(m+1):n] <- cy
cenNID(y, L, U) 



