library(ziphsmm)


### Name: hmmfit
### Title: Estimate the parameters of a general zero-inflated Poisson
###   hidden Markov model by directly minimizing of the negative
###   log-likelihood function using the gradient descent algorithm.
### Aliases: hmmfit

### ** Examples

prior_init <- c(0.5,0.2,0.3)
emit_init <- c(10,40,70)
zero_init <- c(0.5,0,0)
omega <- matrix(c(0.5,0.3,0.2,0.4,0.3,0.3,0.2,0.4,0.4),3,3,byrow=TRUE)
result <- hmmsim(n=1000,M=3,prior=prior_init, tpm_parm=omega,
         emit_parm=emit_init,zeroprop=zero_init)
y <- result$series
fit <- hmmfit(y=y,M=3,prior_init=prior_init,tpm_init=omega,
     emit_init=emit_init,zero_init=zero_init,
     method="Nelder-Mead",hessian=TRUE,control=list(maxit=500,trace=1))
str(fit)

#variances for the 12 working parameters, which are the logit of prior probabilities
#for state 2 and state 3, the generalized logit of the transition probability matrix
#(tpm[1,2],tpm[1,3],tpm[2,2],tpm[2,3],tpm[3,2],tpm[3,3]), the logit of structural zero
#proportions for state 1, and log of poisson means for state 1, 2, and 3
#logit of non-zero zero proportions, and the log of poisson means
variance <- diag(solve(fit$obsinfo))

#with covariates
data(CAT)
y <- CAT$activity
x <- data.matrix(CAT$night)
prior_init <- c(0.5,0.2,0.3)
emit_init <- c(10,50,100)
zero_init <- c(0.5,0,0)
omega <- matrix(c(0.5,0.3,0.2,0.4,0.3,0.3,0.2,0.4,0.4),3,3,byrow=TRUE)
fit2 <-  hmmfit(y,rep(1440,3),3,prior_init,omega,
     emit_init,zero_init, emit_x=x,zeroinfl_x=x,hessian=FALSE,
     method="Nelder-Mead", control=list(maxit=500,trace=1))
fit2
     
## Not run: 
##D #two zero-inflated poissons
##D prior_init <- c(0.5,0.5)
##D emit_init <- c(10,50)
##D zero_init <- c(0.6,0.3)
##D omega <- matrix(c(0.9,0.1,0.2,0.8),2,2,byrow=TRUE)
##D result <- hmmsim(n=1000,M=2,prior=prior_init, tpm_parm=omega,
##D          emit_parm=emit_init,zeroprop=zero_init)
##D y <- result$series
##D fit <- hmmfit(y=y,M=2,prior_init=prior_init,tpm_init=omega,
##D      emit_init=emit_init,zero_init=zero_init,
##D      method="Nelder-Mead",hessian=FALSE,control=list(maxit=500,trace=1))
##D str(fit)
##D 
##D #four regular poissons
##D prior_init <- c(0.4,0.2,0.2,0.2)
##D emit_init <- c(10,40,70,100)
##D zero_init <- c(0,0,0,0)
##D omega <- matrix(c(0.3,0.3,0.2,0.2,0.4,0.2,0.3,0.1,
##D                   0.2,0.2,0.3,0.3,0.1,0.2,0.3,0.4),4,4,byrow=TRUE)
##D result <- hmmsim(n=1000,M=4,prior=prior_init, tpm_parm=omega,
##D          emit_parm=emit_init,zeroprop=zero_init)
##D y <- result$series
##D fit <- hmmfit(y=y,M=4,prior_init=prior_init,tpm_init=omega,
##D      emit_init=emit_init,zero_init=zero_init,
##D      method="Nelder-Mead",hessian=FALSE,control=list(maxit=500,trace=1))
##D str(fit)
## End(Not run)



