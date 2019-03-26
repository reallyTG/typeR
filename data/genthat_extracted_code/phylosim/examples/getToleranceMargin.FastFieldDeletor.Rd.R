library(phylosim)


### Name: getToleranceMargin.FastFieldDeletor
### Title: Get the tolerance margin
### Aliases: getToleranceMargin.FastFieldDeletor
###   FastFieldDeletor.getToleranceMargin
###   getToleranceMargin,FastFieldDeletor-method

### ** Examples

	# create a geometric FastFieldDeletor
	p<-FastFieldDeletor()
	# set/get tolerance margin
	setToleranceMargin(p,0.8)
	getToleranceMargin(p)
	# set/get tolerance margin via virtual field
	p$toleranceMargin<-0.75
	p$toleranceMargin
 


