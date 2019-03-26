library(phylosim)


### Name: omegaVarM3.CodonSequence
### Title: The M3 (discrete) model of variable omega ratios among sites
### Aliases: omegaVarM3.CodonSequence CodonSequence.omegaVarM3
###   omegaVarM3,CodonSequence-method

### ** Examples

	# create a GY94 object
	p<-GY94(kappa=2)
	# create a CodonSequence object, attach process p
	s<-CodonSequence(length=25, processes=list(list(p)))
	# sample states
	sampleStates(s)
	# sample omegas in range 1:20 from model M3
	omegaVarM3(s,p,omegas=c(0,2,4),probs=c(1/3,1/3,1/3),1:20)
	# get omega values
	getOmegas(s,p)
	# get a histogram of omega values in range 1:20
	omegaHist(s,p,breaks=50,1:20)
 


