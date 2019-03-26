library(adagio)


### Name: assignment
### Title: Linear Sum Assignment Problem
### Aliases: assignment

### ** Examples

##  Example similar to clue::solve_LSAP
set.seed(8237)
x <- matrix(sample(1:100), nrow = 10)
y <- assignment(x)
# show permutation and check minimum sum
y$perm; y$t                     # 4  5  7  2  6  1  3  8 10  9
z <- cbind(1:10, y$perm)        # 156
x[z]                            # 5  4 11  8 20  7 38 15 22 26
y$min == sum(x[z])              # TRUE

## Not run: 
##D ##  Example: minimize sum of distances of complex points
##D n <- 100
##D x <- rt(n, df=3) + 1i * rt(n, df=3)
##D y <- runif(n) + 1i * runif(n)
##D cmat <- round(outer(x, y, FUN = function(x,y) Mod(x - y)), 2)
##D dmat <- round(100*cmat, 2)
##D system.time(T1 <- assignment(dmat))   # elapsed: 0.003
##D T1$min / 100                          # 139.32
##D 
##D library("clue")
##D system.time(T2 <- solve_LSAP(cmat))     # elapsed: 0.034
##D sum(cmat[cbind(1:n, T2)])               # 139.32
## End(Not run)



