library(adlift)


### Name: invtnp
### Title: invtnp
### Aliases: invtnp invtnp2
### Keywords: methods

### ** Examples

#
# Generate some one-dimensional data: 500 observations.
x2<-runif(500)
f2<-make.signal2("bumps",x=x2)
#
# perform the forward transform...
out<-fwtnp(x2,f2,LocalPred=AdaptPred)
#
# and now invert using the information from out...
#
fhat<-invtnp(x2,out$coeff,out$lengths,out$lengthsremove,out$pointsin,out$removelist,
 out$neighbrs,out$schemehist,out$interhist,LocalPred=AdaptPred)
#
# Now compare the original signal with the reconstruction.
sum(abs(f2-fhat$coeff))
# 



