library(MoEClust)


### Name: MoE_control
### Title: Set control values for use with MoEClust
### Aliases: MoE_control
### Keywords: control

### ** Examples

## Not run: 
##D ctrl1 <- MoE_control(criterion="icl", itmax=100, warn.it=15, init.z="random")
##D 
##D data(CO2data)
##D GNP   <- CO2data$GNP
##D res   <- MoE_clust(CO2data$CO2, G=2, expert = ~ GNP, control=ctrl1)
##D 
##D # Alternatively, specify control arguments directly
##D res2  <- MoE_clust(CO2data$CO2, G=2, expert = ~ GNP, stopping="relative")
##D 
##D # Supplying ctrl1 without naming it as control throws an error,
##D # when any of {modelNames, gating, expert} are not supplied
##D res3  <- MoE_clust(CO2data$CO2, G=2, expert = ~ GNP, ctrl1)
##D 
##D # Initialise via the mixed-type joint distribution of response & covariates
##D # Let the ICL criterion determine the optimal clustMD model type
##D ctrl2 <- MoE_control(exp.init=list(clustMD=TRUE, mahalanobis=FALSE), init.crit="icl")
##D data(ais)
##D library(clustMD)
##D res4  <- MoE_clust(ais[,3:7], G=2, modelNames="EVE", expert=~sex,
##D                    network.data=ais, control=ctrl2)
##D 
##D # Include a noise component by specifying its prior mixing proportion
##D res5  <- MoE_clust(ais[,3:7], G=2, modelNames="EVE", tau0=0.1)
## End(Not run)



