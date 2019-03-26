library(ziphsmm)


### Name: hmmsim.cont
### Title: Simulate a hidden Markov series and its underlying states with
###   zero-inflated emission distributions
### Aliases: hmmsim.cont

### ** Examples

prior_init <- c(0.5,0.2,0.3)
emit_init <- c(10,40,70)
zero_init <- c(0.5,0,0)
omega <- matrix(c(-0.3,0.2,0.1,0.1,-0.2,0.1,0.2,0.2,-0.4),3,3,byrow=TRUE)
timeindex <- rep(1,1000)
for(i in 2:1000) timeindex[i] <- timeindex[i-1] + sample(1:3,1)
result <- hmmsim.cont(n=1000,M=3,prior=prior_init, tpm_parm=omega,
          emit_parm=emit_init,zeroprop=zero_init,timeindex=timeindex)



