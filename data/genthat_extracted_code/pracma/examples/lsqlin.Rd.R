library(pracma)


### Name: lsqlin
### Title: Linear Least-Squares Fitting
### Aliases: lsqlin
### Keywords: fitting

### ** Examples

A <- matrix(c(
    0.8147,    0.1576,    0.6557,
    0.9058,    0.9706,    0.0357,
    0.1270,    0.9572,    0.8491,
    0.9134,    0.4854,    0.9340,
    0.6324,    0.8003,    0.6787,
    0.0975,    0.1419,    0.7577,
    0.2785,    0.4218,    0.7431,
    0.5469,    0.9157,    0.3922,
    0.9575,    0.7922,    0.6555,
    0.9649,    0.9595,    0.1712), 10, 3, byrow = TRUE)
b <- matrix(c(
    0.7060,    0.4387,
    0.0318,    0.3816,
    0.2769,    0.7655,
    0.0462,    0.7952,
    0.0971,    0.1869,
    0.8235,    0.4898,
    0.6948,    0.4456,
    0.3171,    0.6463,
    0.9502,    0.7094,
    0.0344,    0.7547), 10, 2, byrow = TRUE)
C <- matrix(c(
    1.0000,    1.0000,    1.0000,
    1.0000,   -1.0000,    0.5000), 2, 3, byrow = TRUE)
d <- as.matrix(c(1, 0.5))

# With a full rank constraint system
(L <- lsqlin(A, b, C, d))
#  0.10326838 0.3740381
#  0.03442279 0.1246794
#  0.86230882 0.5012825
C %*% L
#  1.0  1.0
#  0.5  0.5

## Not run: 
##D # With a rank deficient constraint system
##D C <- str2num('[1 1 1;1 1 1]')
##D d <- str2num('[1;1]')
##D (L <- lsqlin(A, b[, 1], C, d))
##D #  0.2583340
##D # -0.1464215
##D #  0.8880875
##D C %*% L         # 1 1  as column vector
##D 
##D # Where both A and C are rank deficient
##D A2 <- repmat(A[, 1:2], 1, 2)
##D C <- ones(2, 4) # d as above
##D (L <- lsqlin(A2, b[, 2], C, d))
##D #  0.2244121
##D #  0.2755879
##D #  0.2244121
##D #  0.2755879
##D C %*% L         # 1 1  as column vector
## End(Not run)



