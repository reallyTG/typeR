library(bReeze)


### Name: clean
### Title: Clean faulty values
### Aliases: clean cln
### Keywords: methods

### ** Examples

## Not run: 
##D # load and prepare data
##D data("winddata", package="bReeze")
##D set40 <- set(height=40, v.avg=winddata[,2], v.std=winddata[,5],
##D   dir.avg=winddata[,14])
##D set30 <- set(height=30, v.avg=winddata[,6], v.std=winddata[,9],
##D   dir.avg=winddata[,16])
##D set20 <- set(height=20, v.avg=winddata[,10], v.std=winddata[,13])
##D ts <- timestamp(timestamp=winddata[,1])
##D neubuerg <- mast(timestamp=ts, set40=set40, set30=set30, 
##D   set20=set20)
##D 
##D # clean faulty values of a met mast
##D neubuerg.clean <- clean(mast=neubuerg)
##D 
##D # compare a subset of the original and cleaned data
##D neubuerg$sets$set40$data$v.avg[660:670]
##D neubuerg.clean$sets$set40$data$v.avg[660:670]
##D 
##D 
##D # clean faulty values of a dataset
##D set40.clean <- clean(set=set40)
##D   
##D # clean just one dataset of a met mast
##D neubuerg.clean.2 <- clean(mast=neubuerg, set=1)
##D neubuerg.clean.2 <- clean(mast=neubuerg, set="set40")	# same as above
##D 
##D # change lower wind speed limit 
##D neubuerg.clean.3 <- clean(mast=neubuerg, v.avg.min=0.3)
##D 
##D # compare number of samples set to 'NA', due to lowered limit
##D length(which(is.na(neubuerg.clean$sets$set40$data$v.avg)==TRUE))
##D length(which(is.na(neubuerg.clean.3$sets$set40$data$v.avg)==TRUE))
##D 
##D 
##D # change wind speed limit for cleaning of turbulence intensity
##D neubuerg.clean.4 <- clean(mast=neubuerg, turb.clean=3)
##D 
##D # compare number of samples set to 'NA', due to turb.clean
##D neubuerg.clean$sets$set40$data$turb.int[75:100]
##D neubuerg.clean.4$sets$set40$data$turb.int[75:100]
##D 
##D 
##D # check whether icing is assumed for any samples
##D neubuerg.clean.5 <- clean(mast=neubuerg, set=1, v.avg.min=0, 
##D   v.avg.max=100, dir.clean=FALSE, turb.clean=0, icing=TRUE)
##D not.cleaned <- which(is.na(neubuerg$sets$set40$data$dir.avg)==TRUE)
##D cleaned <- which(is.na(neubuerg.clean.5$sets$set40$data$dir.avg)==TRUE)
##D length(cleaned)-length(cleaned)	# no icing here
##D 
##D # checked time stamp to exclude implausible icing assumptions (e.g. in summer)
##D # (which makes no sense here, since cleaned is empty)
##D neubuerg.clean.5$timestamp[cleaned]
##D 
##D 
##D # clean repetitions
##D neubuerg.clean.6 <- clean(mast=neubuerg, rep=c("v.avg", "dir.avg"))
##D neubuerg.clean.7 <- clean(mast=neubuerg, rep="v.avg", n.rep=3)
## End(Not run)



