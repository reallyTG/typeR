library(BLRPM)


### Name: BLRPM.sim
### Title: Simulating precipitation with the BLRPM
### Aliases: BLRPM.sim

### ** Examples

lambda <- 4/240
gamma <- 1/10
beta <- 0.3
eta <- 2
mux <- 4
t.sim <- 240
t.acc <- t.sim
interval <- 1
offset <- 0
simulation <- BLRPM.sim(lambda,gamma,beta,eta,mux,t.sim,t.acc=t.sim,interval,offset)



