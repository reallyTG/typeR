library(ziphsmm)


### Name: hsmmviterbi2
### Title: Viterbi algorithm to decode the latent states in hidden
###   semi-Markov models with covariates
### Aliases: hsmmviterbi2

### ** Examples


## Not run: 
##D data(CAT)
##D y <- CAT$activity
##D x <- data.matrix(CAT$night)
##D prior_init <- c(0.5,0.3,0.2)
##D dt_init <- c(0.9,0.6,0.3)
##D emit_init <- c(10,50,100)
##D zero_init <- c(0.5,0,0) #assuming only the 1st state has structural zero's
##D tpm_init <- matrix(c(0,0.3,0.7,0.4,0,0.6,0.5,0.5,0),3,3,byrow=TRUE)
##D trunc <- c(10,7,4)
##D fit2 <-  hsmmfit(y,rep(1440,3),3,trunc,prior_init,"log",dt_init,tpm_init,
##D      emit_init,zero_init,emit_x=x,zeroinfl_x=x,hessian=FALSE,
##D      method="Nelder-Mead", control=list(maxit=500,trace=1))
##D decode <- hsmmviterbi2(y,rep(1440,3),3,trunc,fit2$working_parameters,
##D             dt_dist="log", zero_init=c(1,0,0),
##D             emit_x=x,zeroinfl_x=x, plot=TRUE, xlab="time", ylab="count",
##D             xlim=c(0,360),ylim=c(0,200))
## End(Not run)



