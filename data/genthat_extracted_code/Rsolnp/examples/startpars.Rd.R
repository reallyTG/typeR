library(Rsolnp)


### Name: startpars
### Title: Generates and returns a set of starting parameters by sampling
###   the parameter space based on the evaluation of the function and
###   constraints.
### Aliases: startpars
### Keywords: optimize

### ** Examples

## Not run: 
##D library(Rsolnp)
##D library(parallel)
##D # Windows
##D cl = makePSOCKcluster(2)
##D # Linux:
##D # makeForkCluster(nnodes = getOption("mc.cores", 2L), ...)
##D 
##D gofn = function(dat, n)
##D {
##D 	
##D 	x = dat[1:n]
##D 	y = dat[(n+1):(2*n)]
##D 	z = dat[(2*n+1):(3*n)]
##D 	ii = matrix(1:n, ncol = n, nrow = n, byrow = TRUE)
##D 	jj = matrix(1:n, ncol = n, nrow = n)
##D 	ij = which(ii<jj, arr.ind = TRUE)
##D 	i = ij[,1]
##D 	j = ij[,2]
##D 	#  Coulomb potential
##D 	potential = sum(1.0/sqrt((x[i]-x[j])^2 + (y[i]-y[j])^2 + (z[i]-z[j])^2))
##D 	potential
##D }
##D 
##D goeqfn = function(dat, n)
##D {
##D 	x = dat[1:n]
##D 	y = dat[(n+1):(2*n)]
##D 	z = dat[(2*n+1):(3*n)]
##D 	apply(cbind(x^2, y^2, z^2), 1, "sum")
##D }
##D n = 25
##D LB  = rep(-1, 3*n)
##D UB  = rep( 1, 3*n)
##D eqB = rep( 1,   n)
##D 
##D sp = startpars(pars = NULL, fixed = NULL, fun = gofn , eqfun = goeqfn, 
##D eqB = eqB, ineqfun = NULL, ineqLB = NULL, ineqUB = NULL, LB = LB, UB = UB, 
##D distr = rep(1, length(LB)), distr.opt = list(), n.sim = 2000, 
##D cluster = cl, rseed = 100, bestN = 15, eval.type = 2, n = 25)
##D #stop cluster
##D stopCluster(cl)
##D # the last column is the value of the evaluated function (here it is the barrier 
##D # function since eval.type = 2) 
##D print(round(apply(sp, 2, "mean"), 3))
##D # remember to remove the last column
##D ans = solnp(pars=sp[1,-76],fun = gofn , eqfun = goeqfn , eqB = eqB, ineqfun = NULL, 
##D ineqLB = NULL, ineqUB = NULL, LB = LB, UB = UB, n = 25)
##D # should get a value of around 243.8162
## End(Not run)


