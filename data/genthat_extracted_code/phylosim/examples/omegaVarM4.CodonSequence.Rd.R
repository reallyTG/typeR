library(phylosim)


### Name: omegaVarM4.CodonSequence
### Title: The M4 (freqs) model of variable omega ratios among sites
### Aliases: omegaVarM4.CodonSequence CodonSequence.omegaVarM4
###   omegaVarM4,CodonSequence-method

### ** Examples

	# create a GY94 object
	p<-GY94(kappa=2)
	# create a CodonSequence object, attach process p
	s<-CodonSequence(length=25, processes=list(list(p)))
	# sample states
	sampleStates(s)
	# sample omegas in range 1:20 from model M4
	omegaVarM4(s,p,probs=c(2/5,1/5,1/5,1/10,1/10),1:20)
	# get omega values
	getOmegas(s,p)
	# get a histogram of omega values in range 1:20
	omegaHist(s,p,breaks=50,1:20)
 


