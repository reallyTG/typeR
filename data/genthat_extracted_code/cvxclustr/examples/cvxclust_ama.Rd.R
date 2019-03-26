library(cvxclustr)


### Name: cvxclust_ama
### Title: Convex clustering via AMA
### Aliases: cvxclust_ama

### ** Examples

## Create random problem
seed <- 12345
p <- 10
n <- 20
rnd_problem <- create_clustering_problem(p,n,seed)
X <- rnd_problem$X
ix <- rnd_problem$ix
M1 <- rnd_problem$M1
M2 <- rnd_problem$M2
s1 <- rnd_problem$s1
s2 <- rnd_problem$s2
w  <- rnd_problem$w
nK <- nrow(ix)
Lambda <- matrix(rnorm(p*nK),p,nK)
gamma <- 0.1
nu <- 1.999/n
max_iter <- 1e6
tol <- 1e-15
sol_ama <- cvxclust_ama(X,Lambda,ix,M1,M2,s1,s2,w,gamma,nu,max_iter=max_iter,tol=tol)



