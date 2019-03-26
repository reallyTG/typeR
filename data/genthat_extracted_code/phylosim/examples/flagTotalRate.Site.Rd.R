library(phylosim)


### Name: flagTotalRate.Site
### Title: Flag the total event rate
### Aliases: flagTotalRate.Site Site.flagTotalRate
###   flagTotalRate,Site-method

### ** Examples

	# create a site object:
	p<-K80(rate.params=list("Alpha"=2,"Beta"=0.5))
	s<-Site(alphabet=NucleotideAlphabet(), state="G", processes=list(p))
	# get site rate
	s$totalRate
	# modifying site object in a dangerous way (do not do this under any circumstances!)
	s$.processes = list()	# site object is now inconsistent!
	# get cached rate
	s$totalRate		# incorrect value
	# flag total rate
	flagTotalRate(s)
	# get site rate
	s$totalRate		# correct value

 


