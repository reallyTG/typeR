library(phylosim)


### Name: clone.ToleranceSubstitution
### Title: Clone a ToleranceSubstitution object
### Aliases: clone.ToleranceSubstitution ToleranceSubstitution.clone
###   clone,ToleranceSubstitution-method

### ** Examples

	# create a ToleranceSubstitution object
	p<-ToleranceSubstitution(
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
 


