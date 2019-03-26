library(bigmatch)


### Name: optconstant
### Title: Finds the optimal constant.
### Aliases: optconstant

### ** Examples

## No test: 
data(nh0506)
attach(nh0506)

#optimal constant using the propensity score alone
optconstant(z,propens,rank=FALSE)

#optimal constant for the propensity score while requiring
#an exact match for female
optconstant(z,propens,exact=female,rank=FALSE)

#optimal constant for the propensity score given a caliper
oc=optcal(z,propens,tol=0.1,rank=FALSE)
optconstant(z,propens,caliper=oc$caliper,rank=FALSE)
detach(nh0506)
## End(No test)



