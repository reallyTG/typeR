library(phylosim)


### Name: hasUndefinedRate.ToleranceSubstitution
### Title: Check if a ToleranceSubstitution object has undefined rates
### Aliases: hasUndefinedRate.ToleranceSubstitution
###   ToleranceSubstitution.hasUndefinedRate
###   hasUndefinedRate,ToleranceSubstitution-method

### ** Examples

	# create a ToleranceSubstitution object
	p<-ToleranceSubstitution(alphabet=BinaryAlphabet())
	# check if it has undefined rates
	hasUndefinedRate(p)	# TRUE
	# set the missing rates
	p$rateList<-list("0->1"=1,"1->0"=2)
	# check for undefined rates again
	hasUndefinedRate(p)	# FALSE
 


