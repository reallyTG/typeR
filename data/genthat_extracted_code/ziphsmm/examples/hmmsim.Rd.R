library(ziphsmm)


### Name: hmmsim
### Title: Simulate a hidden Markov series and its underlying states with
###   zero-inflated emission distributions
### Aliases: hmmsim

### ** Examples

prior_init <- c(0.5,0.2,0.3)
emit_init <- c(10,50,100)
zeroprop <- c(0.5,0,0)
omega <- matrix(c(0.5,0.3,0.2,0.4,0.3,0.3,0.2,0.4,0.4),3,3,byrow=TRUE)
result <- hmmsim(n=1000,M=3,prior=prior_init, tpm_parm=omega,
         emit_parm=emit_init,zeroprop=zeroprop)
str(result)




