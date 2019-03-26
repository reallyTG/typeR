library(CommunityCorrelogram)


### Name: lagSelect
### Title: Lag Selection
### Aliases: lagSelect
### Keywords: multivariate spatial chron

### ** Examples

  ## Not run: 
##D     #spatial lag selection
##D       data(mite)
##D       data(mite.xy)
##D       lagSelect(sampleData=mite,sampleLocation=cbind(mite.xy,z=0),lagmin=0.1
##D       ,lagmax=1,by=0.1,numTests=9)
##D       
##D       #temporal lag selection
##D       data(pyrifos)
##D       pyrifos.levels<-data.frame(ditch=gl(12,1,length=132),
##D       dose=factor(rep(c(0.1, 0, 0, 0.9, 0, 44, 6, 0.1, 44, 0.9, 0, 6),11)),
##D           week= as.numeric(as.character(gl(11, 12,
##D           labels=c(-4, -1, 0.1, 1, 2, 4, 8, 12, 15, 19, 24)))))
##D       lagSelect(sampleData=pyrifos,sampleTime=pyrifos.levels$week,
##D       option=2,lagmin=1,lagmax=6,by=1,numTests=9)
##D   
## End(Not run)



