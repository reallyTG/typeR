library(ziphsmm)


### Name: hsmmsim
### Title: Simulate a hidden semi-Markov series and its corresponding
###   states according to the specified parameters
### Aliases: hsmmsim

### ** Examples

prior_init <- c(0.5,0.2,0.3)
dt_init <- c(0.8,0.5,0.2)
emit_init <- c(10,50,100)
zeroprop <- c(0.6,0.3,0.1)
omega <- matrix(c(0,0.3,0.7,0.4,0,0.6,0.5,0.5,0),3,3,byrow=TRUE)
sim1 <- hsmmsim(n=1000,M=3,prior=prior_init,dt_dist="log",
         dt_parm=dt_init, tpm_parm=omega,
         emit_parm=emit_init,zeroprop=zeroprop)
str(sim1)

prior_init <- c(0.5,0.5)
dt_init <- c(10,5)
emit_init <- c(10,30)
zeroprop <- c(0.5,0)
omega <- matrix(c(0,1,1,0),2,2,byrow=TRUE)
sim2 <- hsmmsim(n=1000,M=2,prior=prior_init,dt_dist="shiftpoisson",
         dt_parm=dt_init, tpm_parm=omega,
         emit_parm=emit_init,zeroprop=zeroprop)
str(sim2)
hist(sim2$series,main="Histogram of observed values",xlab="observed values")




