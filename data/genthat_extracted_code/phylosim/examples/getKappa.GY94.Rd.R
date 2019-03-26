library(phylosim)


### Name: getKappa.GY94
### Title: Get the transition/transversion rate ratio
### Aliases: getKappa.GY94 GY94.getKappa getKappa,GY94-method

### ** Examples

	# create a GY94 object
	p<-GY94()
	# set/get kappa
	setKappa(p,2)
	getKappa(p)
	# set/get kappa via virtual field
	p$kappa<-3
	p$kappa
 


