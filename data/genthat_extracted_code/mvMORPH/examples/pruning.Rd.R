library(mvMORPH)


### Name: pruning
### Title: Pruning algorithm to compute the square root of the phylogenetic
###   covariance matrix and it's determinant.
### Aliases: pruning
### Keywords: Matrix square root Determinant GLS Independent contrasts

### ** Examples


## Simulated dataset
set.seed(14)
# Generating a random tree
tree<-pbtree(n=50)
Y <- mvSIM(tree, model="BM1", param=list(sigma=1, theta=0)) # trait
X <- matrix(1, nrow=Ntip(tree), ncol=1) # design matrix

## Use the GLS trick
# Compute the matrix square root
C <- vcv.phylo(tree)
D <- chol(C)
Cinv <- solve(C)
Di <- chol(Cinv)

# transform the traits
Xi <- Di%*%X
Yi <- Di%*%Y

# Compute the GLS estimate and determinant (see Clavel et al. 2015)
# GLS estimate for the root
print(pseudoinverse(Xi)%*%Yi)

# Determinant of the phylogenetic covariance matrix
print(sum(log(diag(D)^2)))    


## Use the pruning algorithm (much faster)

M <- pruning(tree, inv=TRUE)

Xi <- M$sqrtMat%*%X
Yi <- M$sqrtMat%*%Y

# GLS estimate
print(pseudoinverse(Xi)%*%Yi)

# determinant
print(M$det)

## REML determinant (without variance of the root state; see Felsenstein 1973)
# full REML
log(det(C)) + log(det(t(X)%*%Cinv%*%X))

# pruning REML
sum(log(M$varNode))




