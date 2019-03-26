library(ibmcraftr)


### Name: run_state_trans
### Title: Run state_trans function over a given number of timesteps.
### Aliases: run_state_trans

### ** Examples

pop <- syn_pop(c(19,1,0,0,0)) #synthesizing population
b <- 2 #effective contact rate
param <- list(
list(1,c(2,5),c(NA,.1)), #transition from state 1 to 2 using FOI lambda
list(2,3,100), #transition from state 2 to 3,
list(3,4,100)  #the 3rd term ensures the transition to the next stage
)

timesteps <- 10
transient <- c("param[[1]][[3]][1] <- rate2prob(b*sum(pop[,2],pop[,3])/sum(pop))")
eval(parse(text=transient))

run_state_trans(timesteps, param, pop, transient)
run_state_trans(timesteps, param, pop, transient, useC = FALSE)




