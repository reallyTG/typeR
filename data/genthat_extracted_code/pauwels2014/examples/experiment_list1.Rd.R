library(pauwels2014)


### Name: experiment_list1
### Title: Molecular perturbations.
### Aliases: experiment_list1
### Keywords: datasets Model specific functions

### ** Examples

data(experiment_list1)
data(knobjs)
sapply(	
	1:length(knobjs),
	function(k){
		assign(names(knobjs)[k], knobjs[[k]], envir = .GlobalEnv)
	}
)

theta <- knobjActMult1$datas[[1]]$thetas[1,]
thetaT <- knobjActMult1$transform_params(theta)

temp <- experiment_list1$delete_gene7(thetaT, knobjActMult1$global_parameters$initial_conditions)

rbind(temp$theta, thetaT)
rbind(temp$initial_conditions, knobjActMult1$global_parameters$initial_conditions)




