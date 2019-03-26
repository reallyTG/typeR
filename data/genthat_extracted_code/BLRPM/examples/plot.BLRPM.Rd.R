library(BLRPM)


### Name: plot.BLRPM
### Title: Plotting of an object of 'class' BLRPM
### Aliases: plot.BLRPM

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
plot(simulation,OSC=FALSE)
## No test: 
plot(simulation,OSC=TRUE,start.time=1,end.time=24)
## End(No test)



