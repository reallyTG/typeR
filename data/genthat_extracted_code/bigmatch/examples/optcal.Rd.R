library(bigmatch)


### Name: optcal
### Title: Finds the optimal caliper width.
### Aliases: optcal

### ** Examples

data(nh0506)
attach(nh0506)

#optimal caliper using the propensity score alone
optcal(z,propens,tol=0.1,rank=FALSE)

#optimal caliper using the rank of propensity score
#and match each treated subject with two controls
## No test: 
optcal(z,propens,ncontrol=2,rank=TRUE)
## End(No test)

#optimal caliper for the propensity score while requiring
#an exact match for female
optcal(z,propens,exact=female,tol=0.1,rank=FALSE)

detach(nh0506)




