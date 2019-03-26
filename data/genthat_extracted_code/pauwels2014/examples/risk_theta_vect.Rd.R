library(pauwels2014)


### Name: risk_theta_vect
### Title: Expected risk based on a posterior sample
### Aliases: risk_theta_vect
### Keywords: Model specific functions Risk estimation functions

### ** Examples

data(knobjs)
sapply(	
	1:length(knobjs),
	function(k){
		assign(names(knobjs)[k], knobjs[[k]], envir = .GlobalEnv)
	}
)

thetas <- knobjActMult1$datas[[1]]$thetas[1:10,]

thetas_trans <- t(apply(thetas, 1, transform_params))
risk_theta_vect(thetas_trans, 9)




