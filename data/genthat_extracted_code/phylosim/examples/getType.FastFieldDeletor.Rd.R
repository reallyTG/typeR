library(phylosim)


### Name: getType.FastFieldDeletor
### Title: Get the type of a FastFieldDeletor object
### Aliases: getType.FastFieldDeletor FastFieldDeletor.getType
###   getType,FastFieldDeletor-method

### ** Examples

	# create a FastFieldDeletor, default type (geometric)
	p<-FastFieldDeletor()
	# get type
	getType(p)
	# create a FastFieldDeletor, poisson type
	p<-FastFieldDeletor(type="poisson")
	p$type
 


