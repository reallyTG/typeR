library(phylosim)


### Name: AminoAcidSubst
### Title: The AminoAcidSubst class
### Aliases: AminoAcidSubst

### ** Examples

	# create an object
	p<-AminoAcidSubst()
	# build rate matrix from paml file
	# buildFromPAML(p,"path_to_paml_file")	# do not run this
	# set a rate
	setRate(p,"A->D",2)
	# get object summary
	summary(p)
 


