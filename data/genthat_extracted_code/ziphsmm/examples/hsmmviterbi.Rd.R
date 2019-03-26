library(ziphsmm)


### Name: hsmmviterbi
### Title: Viterbi algorithm to decode the latent states for hidden
###   semi-Markov models
### Aliases: hsmmviterbi

### ** Examples

## Not run: 
##D #3 zero-inflated poissons
##D prior_init <- c(0.3,0.3,0.4)
##D dt_init <- c(10,8,6)
##D emit_init <- c(10,50,100)
##D zeroprop <- c(0.5,0.3,0.2)
##D trunc <- c(10,10,10)
##D omega <- matrix(c(0,0.3,0.7,0.4,0,0.6,0.5,0.5,0),3,3,byrow=TRUE)
##D result <- hsmmsim(n=1000,M=3,prior=prior_init,dt_dist="shiftpoisson",
##D          dt_parm=dt_init, tpm_parm=omega,emit_parm=emit_init,zeroprop=zeroprop)
##D y <- result$series
##D state <- result$state
##D fit <- hsmmfit(y=y,ntimes=NULL,M=3,trunc=trunc,prior_init=prior_init,dt_dist="shiftpoisson",
##D      dt_init=dt_init,tpm_init=omega,emit_init=emit_init,zero_init=zeroprop,
##D      method="Nelder-Mead",hessian=FALSE,control=list(maxit=500,trace=1))
##D decode <- hsmmviterbi(y=y,ntimes=NULL,M=3,trunc=trunc,prior=fit$prior,dt_dist="shiftpoisson",
##D      dt_parm=fit$dt_parm,tpm_parm=fit$tpm,emit_parm=fit$emit_parm,
##D      zero_init=fit$zeroprop,plot=TRUE,xlim=c(0,1000),ylim=c(0,200))
##D #check the missclassification rate
##D sum(decode!=state)/length(state)
## End(Not run)   
     



