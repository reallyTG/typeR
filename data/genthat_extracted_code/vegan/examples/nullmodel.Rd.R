library(vegan)


### Name: nullmodel
### Title: Null Model and Simulation
### Aliases: nullmodel simmat print.nullmodel simulate.nullmodel
###   update.nullmodel str.nullmodel print.simmat smbind
### Keywords: multivariate datagen

### ** Examples

data(mite)
x <- as.matrix(mite)[1:12, 21:30]

## non-sequential nullmodel
(nm <- nullmodel(x, "r00"))
(sm <- simulate(nm, nsim=10))

## sequential nullmodel
(nm <- nullmodel(x, "swap"))
(sm1 <- simulate(nm, nsim=10, thin=5))
(sm2 <- simulate(nm, nsim=10, thin=5))

## sequential nullmodel with burnin and extra updating
(nm <- nullmodel(x, "swap"))
(sm1 <- simulate(nm, burnin=10, nsim=10, thin=5))
(sm2 <- simulate(nm, nsim=10, thin=5))

## sequential nullmodel with separate initial burnin
(nm <- nullmodel(x, "swap"))
nm <- update(nm, nsim=10)
(sm2 <- simulate(nm, nsim=10, thin=5))

## combining multiple simmat objects

## stratification
nm1 <- nullmodel(x[1:6,], "r00")
sm1 <- simulate(nm1, nsim=10)
nm2 <- nullmodel(x[7:12,], "r00")
sm2 <- simulate(nm2, nsim=10)
smbind(sm1, sm2, MARGIN=1)

## binding subsequent samples from sequential algorithms
## start, end, thin retained
nm <- nullmodel(x, "swap")
nm <- update(nm, nsim=10)
sm1 <- simulate(nm, nsim=10, thin=5)
sm2 <- simulate(nm, nsim=20, thin=5)
sm3 <- simulate(nm, nsim=10, thin=5)
smbind(sm3, sm2, sm1, MARGIN=3)

## 'replicate' based usage which is similar to the output
## of 'parLapply' or 'mclapply' in the 'parallel' package
## start, end, thin are set, also noting number of chains
smfun <- function(x, burnin, nsim, thin) {
    nm <- nullmodel(x, "swap")
    nm <- update(nm, nsim=burnin)
    simulate(nm, nsim=nsim, thin=thin)
}
smlist <- replicate(3, smfun(x, burnin=50, nsim=10, thin=5), simplify=FALSE)
smbind(smlist, MARGIN=3) # Number of permuted matrices = 30

## Not run: 
##D ## parallel null model calculations
##D library(parallel)
##D 
##D if (.Platform$OS.type == "unix") {
##D ## forking on Unix systems
##D smlist <- mclapply(1:3, function(i) smfun(x, burnin=50, nsim=10, thin=5))
##D smbind(smlist, MARGIN=3)
##D }
##D 
##D ## socket type cluster, works on all platforms
##D cl <- makeCluster(3)
##D clusterEvalQ(cl, library(vegan))
##D clusterExport(cl, c("smfun", "x"))
##D smlist <- parLapply(cl, 1:3, function(i) smfun(x, burnin=50, nsim=10, thin=5))
##D stopCluster(cl)
##D smbind(smlist, MARGIN=3)
## End(Not run)



