library(phylosim)


### Name: setKappa.F84
### Title: Get the transition transversion rate ratio
### Aliases: setKappa.F84 F84.setKappa setKappa,F84-method

### ** Examples

       # construct a F84 object
       p<-F84();
	# set/get Kappa
	setKappa(p,2)
	getKappa(p)
	# set/get Kappa via virtual field
	p$kappa<-4
	p$kappa
	# get object summary
	summary(p)
 


