library(phylosim)


### Name: hasUndefinedRate.GeneralSubstitution
### Title: Check if a GeneralSubstitution object has undefined rates
### Aliases: hasUndefinedRate.GeneralSubstitution
###   GeneralSubstitution.hasUndefinedRate
###   hasUndefinedRate,GeneralSubstitution-method

### ** Examples

	# create a GeneralSubstitution object
	p<-GeneralSubstitution(alphabet=BinaryAlphabet())
	# check if it has undefined rates
	hasUndefinedRate(p)	# TRUE
	# set the missing rates
	p$rateList<-list("0->1"=1,"1->0"=2)
	# check for undefined rates again
	hasUndefinedRate(p)	# FALSE
 


