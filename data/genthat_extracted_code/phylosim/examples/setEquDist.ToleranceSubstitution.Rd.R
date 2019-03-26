library(phylosim)


### Name: setEquDist.ToleranceSubstitution
### Title: Set the equilibrium distribution for a ToleranceSubstitution
###   object
### Aliases: setEquDist.ToleranceSubstitution
###   ToleranceSubstitution.setEquDist
###   setEquDist,ToleranceSubstitution-method

### ** Examples

	# create a ToleranceSubstitution object
	# provide an Alphabet object and the rates
	p<-ToleranceSubstitution(
                           alphabet=BinaryAlphabet(),
                           rate.list=list("1->0"=1,"0->1"=1)
                           )
	# get equlibrium distribution
	getEquDist(p)
	# get equilibrium distribution via virtual field
	p$equDist
	# re-set the equilibrium distribution
	dist<-p$equDist * 3
	dist
	setEquDist(p,dist)
	p$equDist
	# re-set equilibrium distribution via virtual field
	p$equDist<-p$equDist * 2
	p$equDist
 


