library(phylosim)


### Name: getOmegas.CodonSequence
### Title: Get the omegas from a collection of sites
### Aliases: getOmegas.CodonSequence CodonSequence.getOmegas
###   getOmegas,CodonSequence-method getOmegas.Sequence

### ** Examples

	# create a GY94 process
	p<-GY94()
	# create a CodonSequence object,
	# attach a process p
	s<-CodonSequence(length=20,processes=list(list(p)))
	# set omega values in range 1:5
	setOmegas(s,p,c(0.5,1,1.5),1:5)
	# get omega values from siutes 1,2,3,10, and 20
	getOmegas(s,p,c(1:3,10,20))
 


