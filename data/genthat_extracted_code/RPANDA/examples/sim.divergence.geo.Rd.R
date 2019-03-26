library(RPANDA)


### Name: sim.divergence.geo
### Title: Simulation of trait data under the model of divergent character
###   displacement described in Drury et al. 2017
### Aliases: sim.divergence.geo

### ** Examples

## No test: 

data(Anolis.data)
phylo<-Anolis.data$phylo
geo.object<-Anolis.data$geography.object

#simulate with the OU process present and absent
pars<-expand.grid(0.05,2,1,0,c(2,0),0)
sim.divergence.geo(phylo,pars,Nsegments=2500, plot=FALSE, geo.object)
## End(No test)




