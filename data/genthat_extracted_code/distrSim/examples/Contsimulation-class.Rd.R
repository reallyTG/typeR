library(distrSim)


### Name: Contsimulation-class
### Title: Class "Contsimulation"
### Aliases: Contsimulation-class Contsimulation
###   initialize,Contsimulation-method
### Keywords: manip

### ** Examples

N <- Norm() # N is a standard normal distribution.
C <- Cauchy() # C is a Cauchy distribution
cs <- Contsimulation(filename = "csim",
                     runs = 10,
                     samplesize = 3,
                     seed = setRNG(),
                     distribution.id = N,
                     distribution.c = C,
                     rate = 0.1)
simulate(cs)
# Each of the 30 random numbers is ideal (N-distributed) with
# probability 0.9 and contaminated (C-distributed) with
# probability = 0.1
Data(cs)
Data.id(cs)
Data.c(cs)
ind(cs)
summary(cs)
Data(cs) # different data
savedata(cs) # saves the object in the working directory of R...
load("csim") # loads it again...
Data(cs) # ...without the data - use simulate to return it!



