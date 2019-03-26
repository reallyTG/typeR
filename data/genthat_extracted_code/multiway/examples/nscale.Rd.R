library(multiway)


### Name: nscale
### Title: Scale n-th Dimension of Array
### Aliases: nscale
### Keywords: array algebra

### ** Examples

##########   EXAMPLE 1   ##########
X <- matrix(rnorm(2000), nrow = 100, ncol = 20)
Xr <- nscale(X, mode = 2)                # scale columns to newscale=1
sqrt(colMeans(Xr^2))
Xr <- nscale(X, mode = 2, newscale = 2)  # scale columns to newscale=2
sqrt(colMeans(Xr^2))


##########   EXAMPLE 2   ##########
Xold <- X <- matrix(rnorm(400), nrow = 20, ncol = 20)
iter <- 0
chk <- 1
# iterative scaling of modes 1 and 2
while(iter<500 & chk>=10^-9){
  Xr <- nscale(Xold, mode = 1)
  Xr <- nscale(Xr, mode = 2)
  chk <- sum((Xold-Xr)^2)
  Xold <- Xr
  iter <- iter + 1
}
iter
sqrt(rowMeans(Xr^2))
sqrt(colMeans(Xr^2))


##########   EXAMPLE 3   ##########
X <- array(rnorm(20000), dim = c(100,20,10))
Xc <- nscale(X, mode = 2)   # scale within columns
sqrt(rowMeans(aperm(Xc, perm = c(2,1,3))^2))


##########   EXAMPLE 4   ##########
X <- array(rnorm(100000), dim = c(100,20,10,5))
Xc <- nscale(X, mode = 4)   # scale across 4-th mode
sqrt(rowMeans(aperm(Xc, perm = c(4,1,2,3))^2))


##########   EXAMPLE 5   ##########
X <- replicate(5, array(rnorm(20000), dim = c(100,20,10)), simplify = FALSE)
# mean square of 1 (new way)
Xc <- nscale(X)
rowSums(sapply(Xc, function(x) rowSums(x^2))) / (20*10*5)
# mean square of 1 (old way)
Xc <- nscale(X, ssnew = (20*10*5))
rowSums(sapply(Xc, function(x) rowSums(x^2))) / (20*10*5)






