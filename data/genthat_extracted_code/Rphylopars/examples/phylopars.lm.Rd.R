library(Rphylopars)


### Name: phylopars.lm
### Title: Rphylopars regression
### Aliases: phylopars.lm

### ** Examples

# simulate data
sim_data <- simtraits(ntaxa = 15,ntraits = 4)

phylopars.lm(V4~V1+V2+V3,trait_data=sim_data$trait_data,tree=sim_data$tree)



