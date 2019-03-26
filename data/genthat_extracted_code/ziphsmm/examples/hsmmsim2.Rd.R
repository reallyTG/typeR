library(ziphsmm)


### Name: hsmmsim2
### Title: Simulate a hidden semi-Markov series and its underlying states
###   with covariates
### Aliases: hsmmsim2

### ** Examples

## Not run: 
##D #example 1
##D 
##D dtparm <- c(2,1)  #in the log scale
##D priorparm <- 0
##D zeroindex <- c(1,0)
##D zeroparm <- c(0,-1,1)
##D emitparm <- c(2,0.5,-0.5,4,0.3,-0.2)
##D workparm <- c(dtparm,priorparm,zeroparm,emitparm)
##D 
##D designx <- matrix(rnorm(4000),nrow=2000,ncol=2)
##D result <- hsmmsim2(workparm,2,2000,zeroindex,"shiftpoisson",
##D       emit_x=designx,zeroinfl_x=designx)
##D 
##D y <- result$series
##D 
##D dt_init <- c(8,3)
##D prior_init <- c(0.5,0.5)
##D emit_init <- c(10,50)
##D trunc <- c(13,8)
##D zeroprop <- c(0.8,0)
##D omega <- matrix(c(0,1,1,0),2,2,byrow=TRUE)
##D 
##D 
##D fit1 <- hsmmfit(y=y,M=2,trunc=trunc,prior_init=prior_init,dt_dist="shiftpoisson",
##D      dt_init=dt_init,emit_x=designx,zeroinfl_x=designx,
##D      tpm_init=omega,emit_init=emit_init,zero_init=zeroprop,
##D      method="Nelder-Mead",hessian=FALSE,control=list(maxit=2000,trace=1))
##D 
##D decode <- hsmmviterbi2(y,NULL,2,trunc,fit1$working_parameters,
##D             dt_dist="shiftpoisson", zero_init=zeroprop,
##D             emit_x=designx,zeroinfl_x=designx, plot=TRUE, xlab="time", ylab="count",
##D             xlim=c(0,2000),ylim=c(0,200))
##D sum(decode!=result$state)
##D 
##D 
##D 
##D #example 2
##D 
##D dtparm <- c(2,0,-1)  #logit scale
##D priorparm <- c(0,0)
##D zeroindex <- c(1,0,0)
##D zeroparm <- c(0,-1,1)
##D emitparm <- c(2,0.5,-0.5,4,0.3,-0.2,6,0.2,-0.2)
##D tpmparm <- c(0,0,0)
##D workparm <- c(dtparm,priorparm,zeroparm,emitparm,tpmparm)
##D 
##D designx <- matrix(rnorm(4000),nrow=2000,ncol=2)
##D result <- hsmmsim2(workparm,3,2000,zeroindex,"log",
##D       emit_x=designx,zeroinfl_x=designx)
##D 
##D y <- result$series
##D 
##D dt_init <- c(0.9,0.5,0.3)
##D prior_init <- c(0.3,0.4,0.3)
##D emit_init <- c(10,100,400)
##D trunc <- c(13,5,3)
##D zeroprop <- c(0.8,0,0)
##D omega <- matrix(c(0,0.5,0.5,0.5,0,0.5,0.5,0.5,0),3,3,byrow=TRUE)
##D 
##D 
##D fit2 <- hsmmfit(y=y,M=3,trunc=trunc,prior_init=prior_init,dt_dist="log",
##D      dt_init=dt_init,emit_x=designx,zeroinfl_x=designx,
##D      tpm_init=omega,emit_init=emit_init,zero_init=zeroprop,
##D      method="Nelder-Mead",hessian=FALSE,control=list(maxit=2000,trace=1))
##D 
##D decode <- hsmmviterbi2(y,NULL,3,trunc,fit2$working_parameters,
##D             dt_dist="shiftpoisson", zero_init=zeroprop,
##D             emit_x=designx,zeroinfl_x=designx, plot=TRUE, xlab="time", ylab="count",
##D             xlim=c(0,2000),ylim=c(0,1000))
##D sum(decode!=result$state)
## End(Not run)




