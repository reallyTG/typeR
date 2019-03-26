library(TreeSimGM)


### Name: TreeSimGM-package
### Title: Simulating Phylogenetic Trees under General Bellman Harris and
###   Lineage Shift Model
### Aliases: TreeSimGM-package TreeSimGM
### Keywords: tree, phylogeny, simulation, general model, macroevolution

### ** Examples

##plots the first tree of a list of two simulated trees
#simulation based on age, this case = 3. 
#Note that by default, symmetric = TRUE
#i.e. we simulate under symmetric speciation and under no extinction.
library("TreeSimGM")
trialtrees <- sim.age(3,4,"rweibull(0.4,3)")
plot(trialtrees[[1]])

##obtain 5 trees with 40 tips under asymmetric speciation and with extinction
#simulation, without extinction
mytree <-  sim.taxa(numbsim=5, n=40, m=40,  waitsp="rweibull(0.1,1)", 
waitext="rexp(0.5)", symmetric = FALSE)

#see sim.age and sim.taxa help pages for further details



