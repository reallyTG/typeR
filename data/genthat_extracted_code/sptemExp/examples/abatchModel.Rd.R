library(sptemExp)


### Name: abatchModel
### Title: A Batch Modeing Training Inner Functions
### Aliases: abatchModel
### Keywords: ~kwd1 ~kwd2

### ** Examples


## No test: 
#An example of PM2.5 data from Shandong

dPath=tempdir()
modelPath=paste(dPath,"/models",sep="")
unlink(modelPath,recursive = TRUE)
dir.create(modelPath)

data("trainsample","bnd")
aform=paste0('logpm25 ~sx(rid,bs ="mrf",map =bnd)+sx(monthAv,bs="rw2")')
aform=paste0(aform,'+sx(ndvi,bs="rw2")+sx(aod,bs="rw2")+sx(wnd_avg,bs="rw2")')

formulaStrs=c(aform)

trainsample$tid=as.numeric(strftime(trainsample$date,format= "%j"))
trainsample$logpm25=log(trainsample$pm25)
tids=c(91)
abatchModel(trainsample,bnd,formulaStrs,1,1,"tid",tids,modelPath,"siteid","date","pm25",3)
## End(No test)




