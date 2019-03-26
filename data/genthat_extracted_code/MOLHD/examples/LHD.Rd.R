library(MOLHD)


### Name: LHD
### Title: Generate a random Latin Hypercube design
### Aliases: LHD
### Keywords: Design of Experiments Computer Experiments

### ** Examples


#Generate a random Latin hypercube design with 20 runs and 2 variables
D<-LHD(n = 20,p = 2)
D$design
D$standDesign



