library(pauwels2014)


### Name: observables
### Title: Observable quantities of the model
### Aliases: observables
### Keywords: datasets

### ** Examples

data(observables)
data(knobjs)
sapply(	
	1:length(knobjs),
	function(k){
		assign(names(knobjs)[k], knobjs[[k]], envir = .GlobalEnv)
	}
)
data(exps)

theta <- knobjActMult1$datas[[1]]$thetas[1,]
thetaT <- knobjActMult1$transform_params(theta)

temp <- simulate_experiment_no_transform(thetaT, 
	knobjActMult1$global_parameters$initial_conditions, knobjActMult1)

observable <- observables$mrnaLow
temp[temp[,1] %in% observable$reso, colnames(temp) %in% observable$obs]




