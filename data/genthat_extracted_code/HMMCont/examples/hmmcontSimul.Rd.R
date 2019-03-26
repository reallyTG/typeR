library(HMMCont)


### Name: hmmcontSimul
### Title: Simulation of an observation and underlying Markov processes
###   according to a given model
### Aliases: hmmcontSimul
### Keywords: Simulation Hidden Markov Model

### ** Examples


Returns<-(logreturns(Prices))*10
hmm<-hmmsetcont(Returns)
for(i in 1:6){hmm<-baumwelchcont(hmm)} 
hmmcomplete<-viterbicont(hmm)

sim<-hmmcontSimul(hmmcomplete, n=100) # simulating the processes

plot(sim$StateProcess1, type="l", ylab="State 1 Process")
plot(sim$StateProcess2, type="l", ylab="State 2 Process")
plot(sim$MarkovChain, type="l", ylab="Markov chain")
plot(sim$SimulatedObservation, type="l", ylab="Full HMM Process")



