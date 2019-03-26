library(phylosim)


### Name: setEquDist.GeneralSubstitution
### Title: Set the equilibrium distribution for a GeneralSubstitution
###   object
### Aliases: setEquDist.GeneralSubstitution GeneralSubstitution.setEquDist
###   setEquDist,GeneralSubstitution-method setEquDist.AminoAcidSubst

### ** Examples

	# create a GeneralSubstitution object
	# provide an Alphabet object and the rates
	p<-GeneralSubstitution(
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
 


