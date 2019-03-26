library(pauwels2014)


### Name: estimate_risk_out_all
### Title: Expected risk estimation.
### Aliases: estimate_risk_out_all
### Keywords: Risk estimation function

### ** Examples

data(experiment_list1)
data(observables)
data(knobjs)
sapply(	
	1:length(knobjs),
	function(k){
		assign(names(knobjs)[k], 
			knobjs[[k]], envir = .GlobalEnv)
	}
)

knobjActMult1$global_parameters$n_simu_weights <- 3

estimate_risk_out_all(knobjActMult1$datas[[1]]$thetas[1:10,], 
	knobjActMult1, experiment_list1$nothing)



