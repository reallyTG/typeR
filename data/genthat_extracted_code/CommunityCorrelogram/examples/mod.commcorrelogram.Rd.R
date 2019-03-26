library(CommunityCorrelogram)


### Name: mod.commcorrelogram
### Title: Community Correlogram Model
### Aliases: mod.commcorrelogram mod
### Keywords: models multivariate spatial chron

### ** Examples

  ## Not run: 
##D     data(mite)
##D       data(mite.xy)
##D       mite.commcorr <-commcorrelogram(sampleData=mite,
##D           sampleLocation=cbind(mite.xy,z=0),lagSize=1,lagNumber=7,
##D           lagTol=0.5,option=1,numTests=9) 
##D       mod (mite.commcorr,Ch=1,Cc=2.5,Cw=0.8,pw=3)
##D   
## End(Not run)



