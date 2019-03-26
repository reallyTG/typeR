library(ziphsmm)


### Name: hmmviterbi
### Title: Viterbi algorithm to decode the latent states for hidden Markov
###   models
### Aliases: hmmviterbi

### ** Examples

prior_init <- c(0.5,0.2,0.3)
emit_init <- c(10,40,70)
zero_init <- c(0.5,0,0)
omega <- matrix(c(0.5,0.3,0.2,0.4,0.3,0.3,0.2,0.4,0.4),3,3,byrow=TRUE)
result <- hmmsim(n=1000,M=3,prior=prior_init, tpm_parm=omega,
         emit_parm=emit_init,zeroprop=zero_init)
y <- result$series
state <- result$state
fit <- hmmfit(y=y,M=3,prior_init=prior_init,tpm_init=omega,
     emit_init=emit_init,zero_init=zero_init,
     method="Nelder-Mead",hessian=FALSE,control=list(maxit=500,trace=1))

decode <- hmmviterbi(y,NULL,3,fit$prior,fit$tpm,fit$emit_parm,fit$zeroprop,
                      plot=TRUE,xlab="Time",ylab="Count")      
#check the missclassification rate
sum(decode!=state)/length(state)      

## Not run: 
##D decode <- hmmviterbi(y,NULL,3,fit$prior,fit$tpm,fit$emit_parm,fit$zeroprop,
##D                       plot=TRUE,xlim=c(0,100),ylim=c(0,100),
##D                       xlab="Time",ylab="Count")  
## End(Not run)



