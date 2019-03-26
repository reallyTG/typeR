library(ziphsmm)


### Name: hsmmviterbi_exp
### Title: Viterbi algorithm to decode the latent states in hidden
###   semi-Markov models with covariates where the latent state durations
###   have accelerated failure time structure
### Aliases: hsmmviterbi_exp

### ** Examples

## Not run: 
##D M <- 3
##D prior <- c(0.5,0.3,0.2)
##D dtrate <- c(6,5,4)
##D dtparm <- matrix(c(0.2,0.1,0.2),nrow=3)
##D zeroparm <- c(0,-0.2)
##D emitparm <- matrix(c(4,0.3,5,0.2,6,-0.1),3,2,byrow=TRUE)
##D tpmparm <- c(1,0.2,0.5,-0.2,0,0.2)
##D 
##D emit_x <- matrix(c(rep(1,1000),rep(0,1000)),nrow=2000,ncol=1)
##D dt_x <- emit_x
##D tpm_x <- emit_x
##D zeroinfl_x <- emit_x
##D trunc <- c(18,15,10)
##D 
##D re <- hsmmsim2_exp(prior,dtrate,dtparm,zeroparm,emitparm,tpmparm,
##D                   trunc, M, n, dt_x,tpm_x, emit_x, zeroinfl_x)
##D y <- re$series
##D 
##D rrr <- hsmmfit_exp(y,M,trunc,dtrate,dtparm,prior,zeroparm,emitparm,tpmparm,
##D                   dt_x,zeroinfl_x,emit_x,tpm_x,method="BFGS",control=list(trace=1))
##D 
##D decode <- hsmmviterbi_exp(y,M, trunc,dtrate,dtparm,
##D                           prior,zeroparm,emitparm,tpmparm,
##D                           dt_x, zeroinfl_x, emit_x, tpm_x)
##D sum(decode!=re$state)
## End(Not run)



