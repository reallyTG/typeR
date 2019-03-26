library(phylosim)


### Name: getTotalRate.Site
### Title: Get the total active event rate
### Aliases: getTotalRate.Site Site.getTotalRate getTotalRate,Site-method

### ** Examples


	# create a nucleotide site with a JC69 substitution process attached
       s<-Site(state="A",alphabet=NucleotideAlphabet(),processes=list(JC69()))
       # get the total rate
	getTotalRate(s)
       # add a new process
       attachProcess(s,K80(rate.params=list("Alpha"=1,"Beta"=0.5)))
       # get the total rate via virtual field
       s$totalRate

 


