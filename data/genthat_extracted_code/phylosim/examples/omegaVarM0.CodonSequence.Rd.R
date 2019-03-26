library(phylosim)


### Name: omegaVarM0.CodonSequence
### Title: The M0 (one-ratio) model of variable omega ratios among sites
### Aliases: omegaVarM0.CodonSequence CodonSequence.omegaVarM0
###   omegaVarM0,CodonSequence-method

### ** Examples

	# create a GY94 object
	p<-GY94(kappa=2)
	# create a CodonSequence object, attach process p
	s<-CodonSequence(length=20, processes=list(list(p)))
	# sample states
	sampleStates(s)
	# sample omegas in range 1:5 from model M0
	omegaVarM0(s,p,omega=2,1:5)
	# get omega values
	getOmegas(s,p)
	# get a histogram of omega values in range 1:5
	omegaHist(s,p,breaks=50,1:5)
 


