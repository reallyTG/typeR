library(IPMpack)


### Name: makeDiscreteTrans
### Title: Builds matrix for transitions between discrete (e.g. seedbank,
###   dormant) and continuous (e.g. size) stages.
### Aliases: makeDiscreteTrans

### ** Examples

dff <- generateData(type="discrete")
discTrans <- makeDiscreteTrans(dff)
makeIPMPmatrix(nBigMatrix = 10, growObj = makeGrowthObj(dff), 
	survObj = makeSurvObj(dff), discreteTrans = discTrans)
	
# Often some data needed for makeDiscreteTrans are not available as 
# individual records in your data file. For instance the fate of seeds 
# in the seedbank of the generateData(type="discrete") example:
dff<-generateData()
# Now the transition matrix needs to be entered as an argument, 
# as well as the mean and sd of sizeNext values for discrete to 
# continuous transitions. 
discTrans <- makeDiscreteTrans(dff,
				discreteTrans = matrix(c(.5,.1,.4,0,1,0),
				nrow=3, ncol=2, 
				dimnames = list(c("seedbank","continuous","dead"),
				c("seedbank","continuous"))),
				meanToCont = matrix(c(mean(dff$sizeNext[is.na(dff$stage)
				    &dff$stageNext=="continuous"],na.rm=TRUE)),
					nrow=1, ncol=1, dimnames = list(1,c("seedbank"))), 
					sdToCont = matrix(c(sd(dff$sizeNext[is.na(dff$stage)
					  &dff$stageNext=="continuous"],na.rm=TRUE)),
					nrow=1, ncol=1, dimnames = list(1,c("seedbank"))))
Pmatrix<-makeIPMPmatrix(nBigMatrix = 10, growObj = makeGrowthObj(dff), 
	survObj = makeSurvObj(dff), discreteTrans = discTrans)
Fmatrix<-makeIPMFmatrix(nBigMatrix = 10, fecObj = makeFecObj(dff))
dim(Pmatrix)
dim(Fmatrix)					
# To fix this mismatch, all discrete classes (1 in this case) need to 
# be added to the Fmatrix as well, e.g.:
Fmatrix<-makeIPMFmatrix(nBigMatrix = 10, fecObj = makeFecObj(dff, 
    offspringSplitter=data.frame(seedbank=.3,continuous=.7)))
IPM <- Pmatrix + Fmatrix	



