library(phylosim)


### Name: getType.BrownianInsertor
### Title: Get the type of the BrownianInsertor process
### Aliases: getType.BrownianInsertor BrownianInsertor.getType
###   getType,BrownianInsertor-method

### ** Examples

	p<-BrownianInsertor(type="discrete")
	# get type
	getType(p)
	# get upstream classes
	class(p)
	p<-BrownianInsertor(type="continuous")
	# get type via virtual field
	p$type
	# get upstream classes
	class(p)
 


