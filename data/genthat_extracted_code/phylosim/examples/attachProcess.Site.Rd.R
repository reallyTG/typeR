library(phylosim)


### Name: attachProcess.Site
### Title: Attach a Process object to a Site object
### Aliases: attachProcess.Site Site.attachProcess
###   attachProcess,Site-method

### ** Examples

	# create a Site object and the associated NucleotideAlphabet object
	s<-Site(alphabet=NucleotideAlphabet())
	# create a K80 substitution process
	p<-K80()
	# attach p to s
	attachProcess(s,p)
	# get the list of attached processes
	s$processes
	# check write protection for p
	p$writeProtected
 


