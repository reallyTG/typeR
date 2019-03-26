library(tmvtnorm)


### Name: rtmvnorm2
### Title: Sampling Random Numbers From The Truncated Multivariate Normal
###   Distribution With Linear Constraints
### Aliases: rtmvnorm2
### Keywords: distribution multivariate

### ** Examples

## Not run: 
##D ################################################################################
##D #
##D # Example 5a: Number of linear constraints r > dimension d
##D #
##D ################################################################################
##D 
##D # general linear restrictions a <= Dx <= b with x (d x 1); D (r x d); a,b (r x 1)
##D 
##D # Dimension d=2, r=3 linear constraints
##D #
##D # a1 <=    x1 + x2 <= b2
##D # a2 <=    x1 - x2 <= b2
##D # a3 <= 0.5x1 - x2 <= b3
##D #
##D # [ a1 ] <= [ 1     1 ] [ x1 ] <= [b1]
##D # [ a2 ]    [ 1    -1 ] [ x2 ]    [b2]
##D # [ a3 ]    [ 0.5  -1 ]           [b3]
##D 
##D D <- matrix(
##D       c(  1,  1,
##D           1, -1,
##D         0.5, -1), 3, 2, byrow=TRUE)
##D a <- c(0, 0, 0)
##D b <- c(1, 1, 1)
##D 
##D # mark linear constraints as lines
##D plot(NA, xlim=c(-0.5, 1.5), ylim=c(-1,1))
##D for (i in 1:3) {
##D   abline(a=a[i]/D[i, 2], b=-D[i,1]/D[i, 2], col="red")
##D   abline(a=b[i]/D[i, 2], b=-D[i,1]/D[i, 2], col="red")
##D }
##D 
##D ### Gibbs sampling for general linear constraints a <= Dx <= b
##D mean <- c(0, 0)
##D sigma <- matrix(c(1.0, 0.2, 
##D                   0.2, 1.0), 2, 2)
##D x0 <- c(0.5, 0.2) # Gibbs sampler start value                  
##D X <- rtmvnorm2(n=1000, mean, sigma, lower=a, upper=b, D, start.value=x0)
##D 
##D # show random points within simplex
##D points(X, pch=20, col="black")
## End(Not run)



