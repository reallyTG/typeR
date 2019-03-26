library(phylosim)


### Name: clone.GeneralSubstitution
### Title: Clone a GeneralSubstitution object
### Aliases: clone.GeneralSubstitution GeneralSubstitution.clone
###   clone,GeneralSubstitution-method

### ** Examples

	# create a GeneralSubstitution object
	p<-GeneralSubstitution(
                           alphabet=BinaryAlphabet(),
                           rate.list=list("0->1"=1,"1->0"=2),
                           name="MyBinary"
                           )
	# clone p
	pp<-clone(p)
	# do some checks
	p;pp
	p == p
	p == pp
	equals(p$qMatrix, pp$qMatrix)
 


