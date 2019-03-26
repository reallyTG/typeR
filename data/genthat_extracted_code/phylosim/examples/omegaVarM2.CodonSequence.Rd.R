library(phylosim)


### Name: omegaVarM2.CodonSequence
### Title: The M2 (selection) model of variable omega ratios among sites
### Aliases: omegaVarM2.CodonSequence CodonSequence.omegaVarM2
###   omegaVarM2,CodonSequence-method

### ** Examples

	# create a GY94 object
	p<-GY94(kappa=2)
	# create a CodonSequence object, attach process p
	s<-CodonSequence(length=25, processes=list(list(p)))
	# sample states
	sampleStates(s)
	# sample omegas in range 1:20 from model M2
	omegaVarM2(s,p,p0=0.2,p1=0.3,omega_2=4,1:20)
	# get omega values
	getOmegas(s,p)
	# get a histogram of omega values in range 1:20
	omegaHist(s,p,breaks=50,1:20)
 


