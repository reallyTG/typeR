library(phylosim)


### Name: getKappa.F84
### Title: Get the transition transversion rate ratio
### Aliases: getKappa.F84 F84.getKappa getKappa,F84-method

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
 


