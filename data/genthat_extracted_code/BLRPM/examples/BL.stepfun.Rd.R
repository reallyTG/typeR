library(BLRPM)


### Name: BL.stepfun
### Title: BLRPM continous stepfunction of precipitation
### Aliases: BL.stepfun

### ** Examples

lambda <- 4/240
gamma <- 1/10
beta <- 0.3
eta <- 2
mux <- 4
t.sim <- 240
simulation <- BL.sim(lambda,gamma,beta,eta,mux,t.sim)
stepfun <- BL.stepfun(simulation$cells)



