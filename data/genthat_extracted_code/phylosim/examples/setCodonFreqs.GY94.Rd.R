library(phylosim)


### Name: setCodonFreqs.GY94
### Title: Get codon frequencies
### Aliases: setCodonFreqs.GY94 GY94.setCodonFreqs
###   setCodonFreqs,GY94-method

### ** Examples

	# create a GY94 object
	p<-GY94()
	# get codon frequencies
	getCodonFreqs(p)
	p$codonFreqs
	# set codon frequencies
	p$codonFreqs<-rep(c(1,2,3,4),length.out=61)
	p$codonFreqs
 


