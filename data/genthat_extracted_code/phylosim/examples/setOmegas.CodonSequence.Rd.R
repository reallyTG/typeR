library(phylosim)


### Name: setOmegas.CodonSequence
### Title: Set the omegas for a collection of sites
### Aliases: setOmegas.CodonSequence CodonSequence.setOmegas
###   setOmegas,CodonSequence-method setOmegas.Sequence

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
 


