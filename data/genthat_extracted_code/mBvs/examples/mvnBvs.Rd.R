library(mBvs)


### Name: mvnBvs
### Title: The function to perform variable selection for multivariate
###   normal responses
### Aliases: mvnBvs
### Keywords: multivariate Bayesian variable selection multivariate
###   continuous data

### ** Examples


# loading a data set	
data(simData_cont)
Y <- simData_cont$Y
data <- simData_cont$X
form1 <- as.formula( ~ cov.1+cov.2)
form2 <- as.formula( ~ 1)
lin.pred <- list(form1, form2)

p 		<- dim(data)[2]
p_adj 	<- 0
q 		<- dim(Y)[2]

#####################
## Hyperparameters ##

## Common hyperparameters
##
eta = 0.1
v = rep(10, q)
omega = rep(log(0.5/(1-0.5)), p-p_adj)
common.beta0 <- c(rep(0, q), 10^6)

## Unstructured model
##
rho0 	<- q + 4
Psi0	<- diag(3, q)
US.Sigma <- c(rho0, Psi0)

## Factor-analytic model
##
FA.lam		<- c(rep(0, q), 10^6)
FA.sigSq	<- c(2, 1)

##
hyperParams <- list(eta=eta, v=v, omega=omega, beta0=common.beta0,
					US=list(US.Sigma=US.Sigma),
					FA=list(lambda=FA.lam, sigmaSq=FA.sigSq))
                    
###################
## MCMC SETTINGS ##

## Setting for the overall run
##
numReps    <- 50
thin       <- 1
burninPerc <- 0.5

## Tuning parameters for specific updates
##
##  - those common to all models
mhProp_beta_var  <- matrix(0.5, p+p_adj, q)
##
## - those specific to the unstructured model
mhrho_prop <- 1000
mhPsi_prop <- diag(1, q)
##
## - those specific to the factor-analytic model
mhProp_lambda_var  <- 0.5
      
##
mcmc.US <- list(run=list(numReps=numReps, thin=thin, burninPerc=burninPerc),
                tuning=list(mhProp_beta_var=mhProp_beta_var,
                				mhrho_prop=mhrho_prop, mhPsi_prop=mhPsi_prop))
                
##
mcmc.FA  <- list(run=list(numReps=numReps, thin=thin, burninPerc=burninPerc),
                tuning=list(mhProp_beta_var=mhProp_beta_var,
                			mhProp_lambda_var=mhProp_lambda_var))
                			
#####################
## Starting Values ##

##  - those common to all models
beta0		<- rep(0, q)
B			<- matrix(sample(x=c(0.3, 0), size=q, replace = TRUE), p+p_adj, q)
gamma		<- B
gamma[gamma != 0]	<- 1
##
## - those specific to the unstructured model
Sigma <- diag(1, q) 
##
## - those specific to the factor-analytic model
lambda		<- rep(0.5, q)
sigmaSq		<- 1
                
####################################
## Fitting the unstructured model ##
####################################

startValues	<- vector("list", 2)                
 
startValues[[1]] <- as.vector(c(beta0, B, gamma, Sigma))

beta0		<- rep(0.2, q)
Sigma <- diag(0.5, q) 

startValues[[2]] <- as.vector(c(beta0, B, gamma, Sigma))

fit.us <- mvnBvs(Y, lin.pred, data, model="unstructured", hyperParams, 
				startValues, mcmcParams=mcmc.US)
				
fit.us
summ.fit.us <- summary(fit.us); names(summ.fit.us)
summ.fit.us				

#######################################
## Fitting the factor-analytic model ##
#######################################

startValues	<- vector("list", 2)                
 
startValues[[1]] <- as.vector(c(beta0, B, gamma, sigmaSq, lambda))

beta0		<- rep(0.2, q)
sigmaSq		<- 0.5
startValues[[2]] <- as.vector(c(beta0, B, gamma, sigmaSq, lambda))

fit.fa <- mvnBvs(Y, lin.pred, data, model="factor-analytic", hyperParams, 
				startValues, mcmcParams=mcmc.FA)
				
fit.fa
summ.fit.fa <- summary(fit.fa); names(summ.fit.fa)
summ.fit.fa				





