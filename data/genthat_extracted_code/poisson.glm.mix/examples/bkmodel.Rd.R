library(poisson.glm.mix)


### Name: bkmodel
### Title: EM algorithm for the beta_{k} (m=3) Poisson GLM mixture.
### Aliases: bkmodel

### ** Examples

############################################################
#1.            Example with Initialization 1               #
############################################################


## load a simulated dataset according to the b_jk model
## number of observations: 500
## design: L=(3,2,1)
data("simulated_data_15_components_bjk")
x <- sim.data[,1]
x <- array(x,dim=c(length(x),1))
y <- sim.data[,-1]
## use Initialization 1 with 2 components
## the number of different small runs equals t2=5, 
##	each one consisting of m1 = 5 iterations
## the maximum number of EM iterations is set to m = 1000.
nc <- 2
run <- bkmodel(reference=x, response=y, L=c(3,2,1), m=1000, K=nc, nr=-10*log(10), 
               maxnr=10, t2=5, m2=5, prev.z, prev.clust, start.type=1, 
               prev.alpha, prev.beta)
## retrieve the iteration that the small em converged:
tem <- length(run$psim)/nc
## print the estimate of regression constants alpha.
run$alpha[tem,,]
## print the estimate of regression coefficients beta.
beta <- run$beta[tem,,]
## print the estimate of gamma.
run$gamma
## print the estimate of mixture weights.
run$psim[tem,]
## frequency table of the resulting clustering of the 
##		500 observations among the 2 components.
table(run$clust)
## print the value of the ICL criterion
run$icl
## print the value of the BIC
run$bic
## print the value of the loglikelihood
run$ll


############################################################
#2.            Example with Initialization 2               #
############################################################

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Given the estimates of Example 1, estimate a 3-component mixture using   ~
# Initialization 2. The number of different runs is set to $t2=2$ with     ~
# each one of them using $m2=5$ em iterations.                             ~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
run.previous<-run
## number of conditions
q <- 3
## number of covariates
tau <- 1
## number of components
nc <- 3
## estimated conditional probabilities for K=10
z <- run.previous$z
## number of iteration that the previous EM converged
ml <- length(run.previous$psim)/(nc - 1) 	
## estimates of alpha when K=2
alpha <- array(run.previous$alpha[ml, , ], dim = c(q, nc - 1)) 
## estimates of beta when K=2
beta <- array(run.previous$beta[ml, , ], dim = c(nc - 1, tau))
clust <- run.previous$clust ##(estimated clusters when K=2)


run <- bkmodel(reference=x, response=y, L=c(3,2,1), m=1000, K=nc, nr=-10*log(10), 
               maxnr=10, t2=2, m2=5, prev.z=z, prev.clust=clust, start.type=2, 
               prev.alpha=alpha, prev.beta=beta)

# retrieve the iteration that EM converged 
tem <- length(run$psim)/nc
# estimates of the mixture weights
run$psim[tem,]
# estimates of the regression constants alpha_{jk}, j = 1,2,3, k=1,..,11
run$alpha[tem,,]
# estimates of the regression coefficients beta_{k\tau}, k = 1,..,11, \tau=1
run$beta[tem,,]

# note: useR should specify larger values for Kmax, m1, m2, t1, t2 
#	for a complete analysis.






