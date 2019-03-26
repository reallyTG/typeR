library(MOLHD)


### Name: mpLHD
### Title: Generate the optimal MaxPro Latin Hypercube Design.
### Aliases: mpLHD
### Keywords: Design of Experiments Computer Experiments

### ** Examples


#Generate a optimal maximum projection LHD(20,2) design
D=mpLHD(n=20,p=2)
D$design
D$criterion



