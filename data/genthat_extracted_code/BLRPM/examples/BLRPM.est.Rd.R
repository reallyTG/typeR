library(BLRPM)


### Name: BLRPM.est
### Title: BLRPM Parameter Estimation function
### Aliases: BLRPM.est

### ** Examples

t.sim=240

lambda <- 4/240
gamma <- 1/10
beta <- 0.3
eta <- 2
mux <- 4

pars <- c(lambda,gamma,beta,eta,mux)

sim <- BLRPM.sim(lambda,gamma,beta,eta,mux,t.sim)
est <- BLRPM.est(sim$RR,pars.in=pars,method="BFGS",use.log=TRUE)




