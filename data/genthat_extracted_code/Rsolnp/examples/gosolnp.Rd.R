library(Rsolnp)


### Name: gosolnp
### Title: Random Initialization and Multiple Restarts of the solnp solver.
### Aliases: gosolnp
### Keywords: optimize

### ** Examples

## Not run: 
##D # [Example 1]
##D # Distributions of Electrons on a Sphere Problem:
##D # Given n electrons, find the equilibrium state distribution (of minimal Coulomb
##D # potential) of the electrons positioned on a conducting sphere. This model is
##D # from the COPS benchmarking suite. See http://www-unix.mcs.anl.gov/~more/cops/.
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
##D 
##D n = 25
##D LB = rep(-1, 3*n)
##D UB = rep(1,  3*n)
##D eqB = rep(1, n)
##D ans = gosolnp(pars  = NULL, fixed = NULL, fun = gofn, eqfun = goeqfn, eqB = eqB,
##D LB = LB, UB = UB, control = list(outer.iter = 100, trace = 1),
##D distr = rep(1, length(LB)), distr.opt = list(), n.restarts = 2, n.sim = 20000,
##D rseed = 443, n = 25)
##D # should get a function value around 243.813
##D 
##D # [Example 2]
##D # Parallel functionality for solving the Upper to Lower CVaR problem (not properly
##D # formulated...for illustration purposes only).
##D 
##D mu =c(1.607464e-04, 1.686867e-04, 3.057877e-04, 1.149289e-04, 7.956294e-05)
##D sigma = c(0.02307198,0.02307127,0.01953382,0.02414608,0.02736053)
##D R = matrix(c(1, 0.408, 0.356, 0.347, 0.378,  0.408, 1, 0.385, 0.565, 0.578, 0.356,
##D 0.385, 1, 0.315, 0.332, 0.347, 0.565, 0.315, 1, 0.662, 0.378, 0.578,
##D 0.332, 0.662, 1), 5,5, byrow=TRUE)
##D # Generate Random deviates from the multivariate Student distribution
##D set.seed(1101)
##D v = sqrt(rchisq(10000, 5)/5)
##D S = chol(R)
##D S = matrix(rnorm(10000 * 5), 10000) %*% S
##D ret = S/v
##D RT = as.matrix(t(apply(ret, 1, FUN = function(x) x*sigma+mu)))
##D # setup the functions
##D .VaR = function(x, alpha = 0.05)
##D {
##D 	VaR = quantile(x, probs = alpha, type = 1)
##D 	VaR
##D }
##D 
##D .CVaR = function(x, alpha = 0.05)
##D {
##D 	VaR = .VaR(x, alpha)
##D 	X = as.vector(x[, 1])
##D 	CVaR = VaR - 0.5 * mean(((VaR-X) + abs(VaR-X))) / alpha
##D 	CVaR
##D }
##D .fn1 = function(x,ret)
##D {
##D 	port=ret%*%x
##D 	obj=-.CVaR(-port)/.CVaR(port)
##D 	return(obj)
##D }
##D 
##D # abs(sum) of weights ==1
##D .eqn1  = function(x,ret)
##D {
##D 	sum(abs(x))
##D }
##D 
##D LB=rep(0,5)
##D UB=rep(1,5)
##D pars=rep(1/5,5)
##D ctrl = list(delta = 1e-10, tol = 1e-8, trace = 0)
##D cl = makePSOCKcluster(2)
##D # export the auxilliary functions which are used and cannot be seen by gosolnp
##D clusterExport(cl, c(".CVaR", ".VaR"))
##D ans = gosolnp(pars, fun = .fn1, eqfun = .eqn1, eqB = 1, LB = LB, UB = UB,
##D n.restarts = 2, n.sim=500, cluster = cl, ret = RT)
##D ans
##D # don't forget to stop the cluster!
##D stopCluster(cl)
## End(Not run)



