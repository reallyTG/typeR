library(TreeSim)


### Name: sim.bdtypes.stt.taxa
### Title: sim.bdtypes.stt.taxa: Simulating multitype birth-death trees
###   with a fixed number of tips sampled through time.
### Aliases: sim.bdtypes.stt.taxa

### ** Examples

# Simulate two trees with 10 tips
set.seed(1)
n<-10
lambda <- rbind(c(2,1),c(3,4))
mu <- c(1,1)
sampprob <-c(0.5,0.5)
numbsim<-2
trees<-lapply(rep(n,numbsim),sim.bdtypes.stt.taxa,
lambdavector=lambda,deathvector=mu,sampprobvector=sampprob)

# Testing the model with exposed class (EI = TRUE)
set.seed(2)
# simulate tree with expected incubation period of 14 days, 
# infectious period of 7 days, and R0 of 1.5:
mu <- c(0,1/7)
lambda <- rbind(c(0,1/14),c(1.5/7,0))
# sampling probability of infectious individuals is 0.35:
sampprob <-c(0,0.35)
# we stop once we have 20 samples:
n <- 20
# we simulate one tree:
numbsim<-1
# We mark first eliminate=10 tips such that we can easily drop them later
# (if deleting these 10 tips, we mimic no sampling close to the outbreak)
trees<-lapply(rep(n,numbsim),sim.bdtypes.stt.taxa,lambdavector=lambda,deathvector=mu,
sampprobvector=sampprob,EI=TRUE,eliminate=10)



