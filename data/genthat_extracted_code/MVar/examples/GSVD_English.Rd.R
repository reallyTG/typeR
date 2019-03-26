library(MVar)


### Name: GSVD
### Title: Generalized Singular Value Decomposition (GSVD).
### Aliases: GSVD
### Keywords: Generalized Singular Value Decomposition GSVD

### ** Examples

M = matrix(c(1,2,3,4,5,6,7,8,9,10,11,12), nrow = 4, ncol = 3)

svd(M)  # Usual Singular Value Decomposition

GSVD(M) # GSVD with the same previous results

# GSVD with weights for rows and columns
GSVD(M, PLin = c(0.1,0.5,2,1.5), PCol = c(1.3,2,0.8)) 



