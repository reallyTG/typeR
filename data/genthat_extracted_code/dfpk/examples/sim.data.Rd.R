library(dfpk)


### Name: sim.data
### Title: Generate and store PK and toxicity data.
### Aliases: sim.data

### ** Examples

TR = 10
N = 30
limitTox <- 10.96                                                
PKparameters <- c(2,10,100)       # PK parameters ka,CL,V
omegaIIV <- 0.7                   # Inter-individual
omegaAlpha <- 0                    
doses <- c(12.59972,34.65492,44.69007,60.80685,83.68946,100.37111)
timeSampling <- seq(0,24,length.out=48)    
sigma <- rep(0.2,length(timeSampling))  # sigma: Additive or proportional error

gen.scen <- sim.data(PKparameters,omegaIIV,omegaAlpha,sigma,doses,
                     limitTox,timeSampling, N, TR, seed=190591) 
gen.scen[[1]]     # returns the first simulated dataset. 


#### Graphical representation of the first simulated data
# plot(gen.scen[[1]])




