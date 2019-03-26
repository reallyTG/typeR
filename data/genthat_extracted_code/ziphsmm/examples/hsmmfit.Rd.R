library(ziphsmm)


### Name: hsmmfit
### Title: Estimate the parameters of a general zero-inflated Poisson
###   hidden semi-Markov model by directly minimizing of the negative
###   log-likelihood function using the gradient descent algorithm.
### Aliases: hsmmfit

### ** Examples


#2 zero-inflated poissons
prior_init <- c(0.5,0.5)
emit_init <- c(10,30)
dt_init <- c(10,6)
trunc <- c(20,10)
zeroprop <- c(0.5,0.3)
omega <- matrix(c(0,1,1,0),2,2,byrow=TRUE)
sim2 <- hsmmsim(n=1000,M=2,prior=prior_init,dt_dist="shiftpoisson",
         dt_parm=dt_init, tpm_parm=omega,
         emit_parm=emit_init,zeroprop=zeroprop)
str(sim2)
y <- sim2$series
fit2 <- hsmmfit(y=y,M=2,trunc=trunc,prior_init=prior_init,dt_dist="shiftpoisson",
     dt_init=dt_init,
     tpm_init=omega,emit_init=emit_init,zero_init=zeroprop,
     method="Nelder-Mead",hessian=FALSE,control=list(maxit=500,trace=1))
str(fit2)


## Not run: 
##D #1 zero-inflated poisson and 3 regular poissons
##D prior_init <- c(0.5,0.2,0.2,0.1)
##D dt_init <- c(0.8,0.7,0.6,0.5)
##D emit_init <- c(10,30,70,130)
##D trunc <- c(10,10,10,10)
##D zeroprop <- c(0.6,0,0,0)  #only the 1st-state is zero-inflated
##D omega <- matrix(c(0,0.5,0.3,0.2,0.4,0,0.4,0.2,
##D                   0.2,0.6,0,0.2,0.1,0.1,0.8,0),4,4,byrow=TRUE)
##D sim1 <- hsmmsim(n=2000,M=4,prior=prior_init,dt_dist="log",
##D          dt_parm=dt_init, tpm_parm=omega,
##D          emit_parm=emit_init,zeroprop=zeroprop)
##D str(sim1)
##D y <- sim1$series
##D fit <- hsmmfit(y=y,M=4,trunc=trunc,prior_init=prior_init,dt_dist="log",dt_init=dt_init,
##D      tpm_init=omega,emit_init=emit_init,zero_init=zeroprop,
##D      method="Nelder-Mead",hessian=TRUE,control=list(maxit=500,trace=1))
##D str(fit)
##D 
##D #variances for the 20 working parameters, which are the logit of parameter p for 
##D #the 4 log-series dwell time distributions, the generalized logit of prior probabilities 
##D #for state 2,3,4, the logit of each nonzero structural zero proportions in state 1, 
##D #the log of 4 state-dependent poisson means, and the generalized logit of the 
##D #transition probability matrix(which are tpm[1,3],tpm[1,4], tpm[2,3],tpm[2,4],
##D #tpm[3,2],tpm[3,4],tpm[4,2],tpm[4,3])
##D variance <- diag(solve(fit$obsinfo)) 
##D 
##D 
##D #1 zero-inflated poisson and 2 poissons with covariates
##D data(CAT)
##D y <- CAT$activity
##D x <- data.matrix(CAT$night)
##D prior_init <- c(0.5,0.3,0.2)
##D dt_init <- c(0.9,0.6,0.3)
##D emit_init <- c(10,20,30)
##D zero_init <- c(0.5,0,0) #assuming only the 1st state has structural zero's
##D tpm_init <- matrix(c(0,0.3,0.7,0.4,0,0.6,0.5,0.5,0),3,3,byrow=TRUE)
##D trunc <- c(10,7,4)
##D fit2 <-  hsmmfit(y,rep(1440,3),3,trunc,prior_init,"log",dt_init,tpm_init,
##D      emit_init,zero_init,emit_x=x,zeroinfl_x=x,hessian=FALSE,
##D      method="Nelder-Mead", control=list(maxit=500,trace=1))
##D fit2
##D 
##D #another example with covariates for 2 zero-inflated poissons
##D data(CAT)
##D y <- CAT$activity
##D x <- data.matrix(CAT$night)
##D prior_init <- c(0.5,0.5)
##D dt_init <- c(10,5)
##D emit_init <- c(10, 30)
##D zero_init <- c(0.5,0.2)
##D tpm_init <- matrix(c(0,1,1,0),2,2,byrow=TRUE)
##D trunc <- c(10,5)
##D fit <-  hsmmfit(y,NULL,2,trunc,prior_init,"shiftpoisson",dt_init,tpm_init,
##D      emit_init,zero_init,dt_x=x,emit_x=x,zeroinfl_x=x,tpm_x=x,hessian=FALSE,
##D      method="Nelder-Mead", control=list(maxit=500,trace=1))
##D fit
## End(Not run)




