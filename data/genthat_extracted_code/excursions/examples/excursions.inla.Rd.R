library(excursions)


### Name: excursions.inla
### Title: Excursion sets and contour credible regions for latent Gaussian
###   models
### Aliases: excursions.inla

### ** Examples

## In this example, we calculate the excursion function
## for a partially observed AR process.
## No test: 
if (require.nowarnings("INLA")) {
## Sample the process:
rho = 0.9
tau = 15
tau.e = 1
n = 100
x = 1:n
mu = 10*((x<n/2)*(x-n/2) + (x>=n/2)*(n/2-x)+n/4)/n
Q = tau*sparseMatrix(i=c(1:n, 2:n), j=c(1:n, 1:(n-1)),
                     x=c(1,rep(1+rho^2, n-2),1, rep(-rho, n-1)),
                     dims=c(n, n), symmetric=TRUE)
X = mu+solve(chol(Q), rnorm(n))

## measure the sampled process at n.obs random locations
## under Gaussian measurement noise.
n.obs = 50
obs.loc = sample(1:n,n.obs)
A = sparseMatrix(i=1:n.obs, j=obs.loc, x=rep(1, n.obs), dims=c(n.obs, n))
Y = as.vector(A %*% X + rnorm(n.obs)/sqrt(tau.e))

## Estimate the parameters using INLA
ef = list(c(list(ar=x),list(cov=mu)))
s.obs = inla.stack(data=list(y=Y), A=list(A), effects=ef, tag="obs")
s.pre = inla.stack(data=list(y=NA), A=list(1), effects=ef,tag="pred")
stack = inla.stack(s.obs,s.pre)
formula = y ~ -1 + cov + f(ar,model="ar1")
result = inla(formula=formula, family="normal", data = inla.stack.data(stack),
              control.predictor=list(A=inla.stack.A(stack),compute=TRUE),
              control.compute = list(config = TRUE))

## calculate the level 0 positive excursion function
res.qc = excursions.inla(result, stack = stack, tag = 'pred', alpha=0.99, u=0,
                         method='QC', type='>', max.threads=2)
## plot the excursion function and marginal probabilities
plot(res.qc$rho,type="l",
     main="marginal probabilities (black) and excursion function (red)")
lines(res.qc$F,col=2)
}
## End(No test)



