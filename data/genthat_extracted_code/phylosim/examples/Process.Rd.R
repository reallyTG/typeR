library(phylosim)


### Name: Process
### Title: The Process class
### Aliases: Process

### ** Examples

	# create a Process object
	p<-Process(name="MyProc",alphabet=AminoAcidAlphabet())
	# check if it's a Process object
	is.Process(p)
	# check object consistency
	checkConsistency(p)
	# set process name
	p$name<-"Ppppproccc"
	# get process name
	p$name
	# get unique process identifier
	p$id
	# get the list of site specific paramters and paramter IDs
	p$siteSpecificParamList
	p$siteSpecificParamIds
	# get Process object summary
	summary(p)
	# clone process object
	pp<-clone(p)
	# test object identity
	p == p
	p == pp
	# create a site object
	s<-Site(alphabet=AminoAcidAlphabet())
	# attach process to Site object
	attachProcess(s,p)
	# get events at specified site
	getEventsAtSite(p,s)	# empty list
	# detach process via virtual field
	s$processes<-list()
	# attach processes via virtual field
	s$processes<-list(p,pp)
	# set the value of the rate multiplier for Site s
	setParameterAtSite(p,s,id="rate.multiplier",value=2)
	# get the value of the rate multiplier for Site s
	getParameterAtSite(p,s,id="rate.multiplier")
 


