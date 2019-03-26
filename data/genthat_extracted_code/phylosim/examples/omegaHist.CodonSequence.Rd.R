library(phylosim)


### Name: omegaHist.CodonSequence
### Title: Plot a histogram of omega values from a range
### Aliases: omegaHist.CodonSequence CodonSequence.omegaHist
###   omegaHist,CodonSequence-method

### ** Examples

	# create a GY94 process
	p<-GY94()
	# create a CodonSequence object,
	# attach a process p
	s<-CodonSequence(length=20,processes=list(list(p)))
       # set omega values through omegaVarM2.CodonSequence
       omegaVarM2(s,p,p0=0.5,p1=0.2,omega=1.5)
       # get a histogram of omega values from the range 1:15
       omegaHist(s,p,breaks=10,1:15)
 


