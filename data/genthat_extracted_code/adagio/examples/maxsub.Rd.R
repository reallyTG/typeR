library(adagio)


### Name: maxsub
### Title: Maximal Sum Subarray
### Aliases: maxsub maxsub2d
### Keywords: optimize

### ** Examples

##  Find a maximal sum subvector
set.seed(8237)
x <- rnorm(1e6)
system.time(res <- maxsub(x, inds = TRUE, compiled = FALSE))
res

##  Standard example: Find a maximal sum submatrix
A <- matrix(c(0,-2,-7,0, 9,2,-6,2, -4,1,-4,1, -1,8,0,2),
            nrow = 4, ncol = 4, byrow =TRUE)
maxsub2d(A)
# $sum:  15
# $inds: 2 4 1 2 , i.e., rows = 2..4, columns = 1..2

## Not run: 
##D ##  Application to points in the unit square:
##D set.seed(723)
##D N <- 50; w <- rnorm(N)
##D x <- runif(N); y <- runif(N)
##D clr <- ifelse (w >= 0, "blue", "red")
##D plot(x, y, pch = 20, col = clr, xlim = c(0, 1), ylim = c(0, 1))
##D 
##D xs <- unique(sort(x)); ns <- length(xs)
##D X  <- c(0, ((xs[1:(ns-1)] + xs[2:ns])/2), 1)
##D ys <- unique(sort(y)); ms <- length(ys)
##D Y  <- c(0, ((ys[1:(ns-1)] + ys[2:ns])/2), 1)
##D abline(v = X, col = "gray")
##D abline(h = Y, col = "gray")
##D 
##D A <- matrix(0, N, N)
##D xi <- findInterval(x, X); yi <- findInterval(y, Y)
##D for (i in 1:N) A[yi[i], xi[i]] <- w[i]
##D 
##D msr <- maxsub2d(A)
##D rect(X[msr$inds[3]], Y[msr$inds[1]], X[msr$inds[4]+1], Y[msr$inds[2]+1])
## End(Not run)



