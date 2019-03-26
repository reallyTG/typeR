library(psych)


### Name: Promax
### Title: Perform Procustes,bifactor, promax or targeted rotations and
###   return the inter factor angles.
### Aliases: Promax Procrustes TargetQ target.rot bifactor biquartimin
###   varimin vgQ.bimin vgQ.targetQ vgQ.varimin equamax
### Keywords: multivariate models

### ** Examples

jen <- sim.hierarchical()
f3 <- fa(jen,3,rotate="varimax")
f3   #not a very clean solution
Promax(f3)
target.rot(f3)
m3 <- fa(jen,nfactors=3)
Promax(m3)  #example of taking the output from factanal
#compare this rotation with the solution from a targeted rotation aimed for 
#an independent cluster solution
target.rot(m3)
#now try a bifactor solution
fb <-fa(jen,3,rotate="bifactor")
fq <- fa(jen,3,rotate="biquartimin")
#Suitbert Ertel has suggested varimin
fm <-  fa(jen,3,rotate="varimin") #the Ertel varimin
fn <- fa(jen,3,rotate="none")  #just the unrotated factors
#compare them
factor.congruence(list(f3,fb,fq,fm,fn))
# compare an oblimin with a target rotation using the Browne algorithm
 #note that we are changing the factor #order (this is for demonstration only)
 Targ <- make.keys(9,list(f1=1:3,f2=7:9,f3=4:6)) 
 Targ <- scrub(Targ,isvalue=1)  #fix the 0s, allow the NAs to be estimated
 Targ <- list(Targ)  #input must be a list
#show the target
 Targ
 fa(Thurstone,3,rotate="TargetQ",Target=Targ)  #targeted rotation
#compare with oblimin
fa(Thurstone,3)





