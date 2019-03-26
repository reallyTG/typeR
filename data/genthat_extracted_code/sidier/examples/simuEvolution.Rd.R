library(sidier)


### Name: simuEvolution
### Title: Simulate sequences evolution
### Aliases: simuEvolution

### ** Examples


#Generating matrix defining evolution:
Input<-matrix(c(1,rep(2:8,2),2:16,rep(0.03,15),rep(0.008,15),rep(0.5,15)),ncol=5)
#Simulating 2 replicates of the evolutionary process:
simuEvolution(input=Input, seqL=1000, iLength=20, nReplicates=2)



