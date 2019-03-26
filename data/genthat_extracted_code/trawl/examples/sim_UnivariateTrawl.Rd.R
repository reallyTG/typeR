library(trawl)


### Name: sim_UnivariateTrawl
### Title: Simulates a univariate trawl process
### Aliases: sim_UnivariateTrawl

### ** Examples

set.seed(1)
t <- 100
Delta <- 1
v <- 250
lambda <- 0.25
#Simulate a univariate trawl process with exponential trawl function and
#Poisson marginal law
trawl <- sim_UnivariateTrawl(t,Delta,burnin=50,marginal =c("Poi"),trawl
="Exp",v=v, lambda1=lambda)
#Plot the sample path of the simulated process
plot(trawl,type="p")



