library(phylosim)


### Name: GeneralSubstitution
### Title: The GeneralSubstitution class
### Aliases: GeneralSubstitution

### ** Examples

	# Create a GeneralSubstitution object
	# also provide an Alphabet objects
	# and the list of unscaled rates
	a<-BinaryAlphabet()
	gs<-GeneralSubstitution(
			name="MyBinarySubst",
			alphabet=a,
			rate.list=list("0->1"=2,"1->0"=1)
		)
	# check if inherits from GeneralSubstitution
	is.GeneralSubstitution(gs)
	# get an object summary
	summary(gs)
	# get a bubble plot
	plot(gs)
	# get unscaled rate for "0->1" by event name
	getRate(gs,"0->1")
	# get unscaled rate for "0->1" by states
	getRate(gs,from="0", to="1")
	# get scaled rate for "0->1" by name
	getEventRate(gs,"0->1")
	# get the list of unscaled event rates
	gs$rateList
	# set the \emph{unscaled} rates
	gs$rateList<-list("0->1"=1,"1->0"=1)
	# reset equilibrium distribution
	gs$equDist<- 5 * gs$equDist
	# get the equilibrium distribution
	gs$equDist
	# sample a state form the equilibrium distribution
	sampleState(gs)
	# get the associated QMatrix object
	gs$qMatrix
	# create a site object
	s<-Site(alphabet=a, state="0")
	# attach gs to s
	s$processes<-list(gs)
	# set rate multiplier for s and gs
	setParameterAtSite(gs,s,id="rate.multiplier",value=2)
	# get site specific rate for "0->1"
	getEventsAtSite(gs,s,"0->1")
	# get the list of active event objects given the state of s
	getEventsAtSite(gs,s)
	# get the associated Alphabet object
	gs$alphabet
	# clone the object
	gsc<-clone(gs)
	# modify the alphabet of gsc
	gsc$alphabet<-NucleotideAlphabet()
	summary(gsc)
	# check if gsc has undefined rates
	hasUndefinedRate(gsc)
 


