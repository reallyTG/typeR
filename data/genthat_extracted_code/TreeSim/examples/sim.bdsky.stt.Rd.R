library(TreeSim)


### Name: sim.bdsky.stt
### Title: sim.bdsky.stt: Simulating sequentially sampled birth-death, SIS,
###   SIR or SIRS trees where birth and death rates are changing through
###   time.
### Aliases: sim.bdsky.stt

### ** Examples

### Set the values for birth rates (lambda), deathrates (mu),
# sampling proportion (sampprob) and times of rate shifts (times).
# Also set the number of sampled tips in the final tree (n) and
# the number of simulations (numbsim).
set.seed(1)
n<-10
lambda <- c(2,1,2)
mu <- c(1,0.5,1.5)
sampprob <-c(0.5,0.5,0.5)
times<-c(0,1,2)
numbsim<-2
# Simulate trees under the birth-death skyline model
trees<-lapply(rep(n,numbsim),sim.bdsky.stt,lambdasky=lambda,deathsky=mu,
timesky=times,sampprobsky=sampprob,rho=0,timestop=0)

### Simulate 10 trees with 100 tips under the SIRS model with 
# total population size N=500
trees<-lapply(rep(100,10),sim.bdsky.stt,lambdasky=c(3,0.5,3,0.5,3),
deathsky=c(0.5,0.5,0.5,0.5,0.5),sampprobsky=c(0.5,0.5,0.5,0.5,0.5),
timesky=c(0,1,2,3,4),trackinfecteds=TRUE,model="SIRS",N=500,
omegasky=c(0,0.5,0.5,0.5,0))

### Simulate 1 tree with 100 tips under the SIRS model with 
# total population size N=500 and plot the S,I,R classes
trees<-sim.bdsky.stt(100,lambdasky=c(3,0.5,3,0.5,3),deathsky=c(0.5,0.5,0.5,0.5,0.5),
sampprobsky=c(0.5,0.5,0.5,0.5,0.5),timesky=c(0,2,2.5,3,3.2),trackinfecteds=TRUE,
model="SIRS",N=500,omegasky=c(0,0.5,0.5,0.5,0.5))
plot(trees[[2]]$eventtimes,trees[[2]]$infecteds,xlim=rev(range(trees[[2]]$eventtimes)),
type="l",col="red",ylim=c(min(trees[[2]]$recovereds,trees[[2]]$infecteds,trees[[2]]$susceptibles),
max(trees[[2]]$recovereds,trees[[2]]$infecteds,trees[[2]]$susceptibles)),
xlab="time",ylab="Number of individuals")
abline(v=trees[[2]]$timesky,lty=2)
points(trees[[2]]$eventtimes,trees[[2]]$recovereds,type="l",col="green")
points(trees[[2]]$eventtimes,trees[[2]]$susceptibles,type="l",col="blue")
points(trees[[2]]$eventtimes,trees[[2]]$cumulativesampleds,type="l",col="grey")
legend("topleft",c("S","I","R","samples","rate changes"),
col=c("blue","red","green","grey","black"),lty=c(1,1,1,1,2))



