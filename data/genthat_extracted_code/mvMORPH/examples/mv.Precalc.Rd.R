library(mvMORPH)


### Name: mv.Precalc
### Title: Model parameterization for the various mvMORPH functions
### Aliases: mv.Precalc
### Keywords: precalculation parameters

### ** Examples

set.seed(14)
# Generating a random tree
tree<-pbtree(n=50)

# Simulate two correlated traits evolving along the phylogeny according to a
# Ornstein-Uhlenbeck process
alpha<-matrix(c(2,1,1,1.3),2,2)
sigma<-matrix(c(1,0.5,0.5,0.8),2,2)
theta<-c(3,1)
nsim<-50
simul<-mvSIM(tree,param=list(sigma=sigma, alpha=alpha, ntraits=2, theta=theta,
             names_traits=c("head.size","mouth.size")), model="OU1", nsim=nsim)

# Do the pre-calculations
precal<-mv.Precalc(tree,nb.traits=2, param=list(method="sparse",model="OU1", root=FALSE))

mvOU(tree, simul[[1]], method="sparse", model="OU1", precalc=precal,
    param=list(decomp="cholesky"))

### Bootstrap
## No test: 
# Fit the model to the "nsim" simulated datasets
 results<-lapply(1:nsim,function(x){
 mvOU(tree, simul[[x]], method="sparse", model="OU1", precalc=precal,
    param=list(decomp="cholesky"))
 })

### Use parallel package
 library(parallel)
 number_of_cores<-2L
 results<-mclapply(simul, function(x){
    mvOU(tree, x, method="sparse", model="OU1", precalc=precal,
       param=list(decomp="cholesky"))
 }, mc.cores = getOption("mc.cores", number_of_cores))


# Summarize (we use the generic S3 method "logLik" to extract the log-likelihood)
loglik<-sapply(results,logLik)
hist(loglik)
	
## End(No test)



