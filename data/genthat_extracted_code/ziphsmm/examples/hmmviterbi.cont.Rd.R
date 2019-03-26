library(ziphsmm)


### Name: hmmviterbi.cont
### Title: Viterbi algorithm to decode the latent states for
###   continuous-time hidden Markov models without covariates
### Aliases: hmmviterbi.cont

### ** Examples

prior_init <- c(0.5,0.2,0.3)
emit_init <- c(10,40,70)
zero_init <- c(0.5,0,0)
omega <- matrix(c(-0.3,0.2,0.1,0.1,-0.2,0.1,0.2,0.2,-0.4),3,3,byrow=TRUE)
timeindex <- rep(1,1000)
for(i in 2:1000) timeindex[i] <- timeindex[i-1] + sample(1:3,1)
result <- hmmsim.cont(n=1000,M=3,prior=prior_init, tpm_parm=omega,
          emit_parm=emit_init,zeroprop=zero_init,timeindex=timeindex)
y <- result$series
fit2 <-  fasthmmfit.cont(y,x=NULL,M=3,prior_init,omega,
                        emit_init,0.5,timeindex=timeindex,hessian=FALSE,
                        method="BFGS", control=list(maxit=500,trace=1))
decode2 <- hmmviterbi.cont(y,3,fit2$prior,fit2$tpm,fit2$emit,
           c(fit2$zeroprop,0,0),timeindex=timeindex)    




