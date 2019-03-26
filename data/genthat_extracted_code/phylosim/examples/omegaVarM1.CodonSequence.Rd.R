library(phylosim)


### Name: omegaVarM1.CodonSequence
### Title: The M1 (neutral) model of variable omega ratios among sites
### Aliases: omegaVarM1.CodonSequence CodonSequence.omegaVarM1
###   omegaVarM1,CodonSequence-method

### ** Examples

	# create a GY94 object
	p<-GY94(kappa=2)
	# create a CodonSequence object, attach process p
	s<-CodonSequence(length=25, processes=list(list(p)))
	# sample states
	sampleStates(s)
	# sample omegas in range 1:20 from model M1
	omegaVarM1(s,p,p0=0.5,1:20)
	# get omega values
	getOmegas(s,p)
	# get a histogram of omega values in range 1:20
	omegaHist(s,p,breaks=50,1:20)
 


