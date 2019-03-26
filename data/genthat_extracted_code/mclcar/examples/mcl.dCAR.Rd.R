library(mclcar)


### Name: mcl.dCAR
### Title: Monte Carlo likelihood calculation for direct CAR models.
### Aliases: mcl.dCAR mcl.prep.dCAR mcl.profile.dCAR vmle.dCAR
###   Avar.lik.dCAR
### Keywords: Monte Carlo variance Monte Carlo likelihood CAR

### ** Examples

## Simulate some data to work with
set.seed(30)
n.torus <- 10
rho <- 0.15
sigma <- 1.5
beta <- c(1, 2)
XX <- cbind(rep(1, n.torus^2), log(1:n.torus^2))
mydata1 <- CAR.simTorus(n.torus, n.torus, rho, 1/sigma)
y <- XX %*% beta + mydata1$X
mydata1$data.vec <- data.frame(y=y, XX[,-1])

## Choose the importance sampler value to the the MPLE
psi1 <- mple.dCAR(mydata1)

## Prepare the Monte Carlo samples
mcdata1 <- mcl.prep.dCAR(psi = psi1, n.samples = 100, data = mydata1)

## Calculate the Monte Carlo likelihoods
mcl.dCAR(c(rho, sigma, beta), data = mydata1, simdata = mcdata1, Evar =
TRUE)
mcl.profile.dCAR(rho, data = mydata1, simdata = mcdata1, Evar = TRUE)

## Do a direct optimization of the Monte Carlo likelihood function
## to find the MLE but it takes very long time to run and may not converge
## Not run: 
##D opt <- optim(psi1, fn = mcl.dCAR,
##D              data = mydata1, simdata = mcdata1,
##D              hessian = TRUE, control = list(fnscale = -0.5))
## End(Not run)

## Assume the we have obtained the opt with the following values
opt<- list(par = c (0.08013547, 1.70294099, 0.01571957, 2.23203089),
           hessian =  matrix(c(  -190.8791352,  -1.5682773,    0.1863733,   -4.844151,
 -1.5682773,  -16.1605186,    0.4911009,    4.403844,
 0.1863733,   0.4911009,  -41.1496774, -156.686631,
-4.8441507,   4.4038442, -156.6866312, -634.316017), 4, 4))

## Calculate the variance of the MC-MLE
vmle.dCAR(opt, data = mydata1, simdata = mcdata1)

## Calculate the asymptotic variance of the likelihood at MC-MLE
Avar.lik.dCAR(pars = opt$par, psi = psi1, data = mydata1, n.samples =
100)




