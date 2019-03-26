library(MOLHD)


### Name: MmLHD
### Title: Generate the optimal Maximin Latin Hypercube Design.
### Aliases: MmLHD
### Keywords: Design of Experiments Computer Experiments

### ** Examples


#Generate the optimal maximin distance LHD(20,2)
D=MmLHD(n=20,p=2)
D$design
D$criterion



