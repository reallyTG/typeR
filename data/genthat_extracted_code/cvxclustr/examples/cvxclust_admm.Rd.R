library(cvxclustr)


### Name: cvxclust_admm
### Title: Convex clustering via ADMM
### Aliases: cvxclust_admm

### ** Examples

## Create random problems
p <- 10
n <- 20
seed <- 12345
nProbs <- 10
errors <- double(nProbs)
for (i in 1:nProbs) {
  seed <- seed + sample(1:1e2,1)
  rnd_problem <- create_clustering_problem(p,n,seed=seed,method='admm')
  X <- rnd_problem$X
  ix <- rnd_problem$ix
  M1 <- rnd_problem$M1
  M2 <- rnd_problem$M2
  s1 <- rnd_problem$s1
  s2 <- rnd_problem$s2
  w  <- rnd_problem$w
  nK <- length(w)
  Lambda <- matrix(rnorm(p*nK),p,nK)
  gamma <- 0.1
  nu <- 1
  max_iter <- 1e6
  tol_abs <- 1e-15
  tol_rel <- 1e-15
  sol_admm_acc <- cvxclust_admm(X,Lambda,ix,M1,M2,s1,s2,w,gamma,nu,max_iter=max_iter,
    tol_abs=tol_abs,tol_rel=tol_rel,accelerate=TRUE)
  sol_admm <- cvxclust_admm(X,Lambda,ix,M1,M2,s1,s2,w,gamma,nu,max_iter=max_iter,
    tol_abs=tol_abs,tol_rel=tol_rel,accelerate=FALSE)
  errors[i] <- norm(as.matrix(sol_admm_acc$U-sol_admm$U),'i')
}



