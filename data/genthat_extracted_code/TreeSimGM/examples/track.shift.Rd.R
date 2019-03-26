library(TreeSimGM)


### Name: track.shift
### Title: Tracking back shifts (speciation or extinction) on TreeSimGM
###   simulated tree
### Aliases: track.shift
### Keywords: general model phylogenetic trees phylogenies simulation
###   macroevolution shift model

### ** Examples

# setting seed for reproductibility

set.seed(2142) 

# Simulating a tree under an asymmetric speciation mode with frequent changes in 
# speciation and extinction (repectively 50% and 30% probability)

shif_spext_asym <- sim.taxa(numbsim=1, n=5,  waitsp="rexp(1)", 
waitext="rexp(0.5)", symmetric = FALSE, 
shiftsp=list(prob=0.5, strength="rnorm(0.5,0.01)"), 
shiftext=list(prob=0.3, strength="runif(0,0.5)"))

# visualiying the generated stochastic tree

plot(shif_spext_asym[[1]]) 


# tracking speciation shifts for species 3
# note that this function returns the shifts on the branches
# starting from the mrca

track.shift(shift="sp", tree=shif_spext_asym[[1]], node=3)

# tracking speciation shifts for species 7

track.shift(shift="sp", tree=shif_spext_asym[[1]], node=7)

# tracking extinction shifts for species 7

track.shift(shift="ext", tree=shif_spext_asym[[1]], node=7)



