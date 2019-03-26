library(mixedsde)


### Name: mixedsde.sim
### Title: Simulation Of A Mixed Stochastic Differential Equation
### Aliases: mixedsde.sim

### ** Examples

#Simulation of 5 trajectories of the OU SDE with random =1, and a Gamma distribution.

simuOU <- mixedsde.sim(M=5, T=10,N=1000,model='OU', random=1,fixed=0.5,
density.phi='gamma', param=c(1.8, 0.8) , sigma=0.1,op.plot=1)
X <- simuOU$X ; 
phi <- simuOU$phi
hist(phi)



