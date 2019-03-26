library(phylosim)


### Name: setKappa.GY94
### Title: Set the transition/transversion rate ratio
### Aliases: setKappa.GY94 GY94.setKappa setKappa,GY94-method

### ** Examples

	# create a GY94 object
	p<-GY94()
	# set/get kappa
	setKappa(p,2)
	getKappa(p)
	# set/get kappa via virtual field
	p$kappa<-3
	p$kappa
 


