library(m2r)


### Name: snf
### Title: Smith normal form
### Aliases: snf snf.

### ** Examples


## Not run: 
##D  requires Macaulay2
##D 
##D ##### basic usage
##D ########################################
##D 
##D M <- matrix(c(
##D    2,  4,   4,
##D   -6,  6,  12,
##D   10, -4, -16
##D ), nrow = 3, byrow = TRUE)
##D 
##D snf(M)
##D 
##D (mats <- snf(M))
##D P <- mats$P; D <- mats$D; Q <- mats$Q
##D 
##D P %*% M %*% Q                # = D
##D solve(P) %*% D %*% solve(Q)  # = M
##D 
##D det(P)
##D det(Q)
##D 
##D 
##D M <- matrix(c(
##D      1,    2,    3,
##D      1,   34,   45,
##D   2213, 1123, 6543,
##D      0,    0,    0
##D ), nrow = 4, byrow = TRUE)
##D (mats <- snf(M))
##D P <- mats$P; D <- mats$D; Q <- mats$Q
##D P %*% M %*% Q                # = D
##D 
##D 
##D ##### other options
##D ########################################
##D 
##D snf.(M)
##D snf(M, code = TRUE)
##D 
##D 
##D 
##D 
## End(Not run)




