library(phylosim)


### Name: getCodonFreqs.GY94
### Title: Get codon frequencies
### Aliases: getCodonFreqs.GY94 GY94.getCodonFreqs
###   getCodonFreqs,GY94-method

### ** Examples

	# create a GY94 object
	p<-GY94()
	# get codon frequencies
	getCodonFreqs(p)
	p$codonFreqs
	# set codon frequencies
	p$codonFreqs<-rep(c(1,2,3,4),length.out=61)
	p$codonFreqs
 


