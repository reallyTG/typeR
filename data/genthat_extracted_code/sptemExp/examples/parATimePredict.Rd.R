library(sptemExp)


### Name: parATimePredict
### Title: Batch Prediction for Time Series Using the Ensemble Models
### Aliases: parATimePredict

### ** Examples


## No test: 
#Use the PM2.5 examples

dPath=tempdir()
modelPath=paste(dPath,"/models",sep="")
unlink(modelPath,recursive = TRUE)
dir.create(modelPath)

prePath=paste(dPath,"/preds",sep="")
unlink(prePath,recursive = TRUE)
dir.create(prePath)

data("trainsample","bnd")
aform=paste0('logpm25 ~sx(rid,bs ="mrf",map =bnd)+sx(monthAv,bs="rw2")')
aform=paste0(aform,'+sx(ndvi,bs="rw2")+sx(aod,bs="rw2")+sx(wnd_avg,bs="rw2")')

formulaStrs=c(aform)

trainsample$tid=as.numeric(strftime(trainsample$date, format = "%j"))

trainsample$logpm25=log(trainsample$pm25)
tids=c(91)

parSpModel(trainsample,bnd,formulaStrs,tidF="tid",tids,c=2,
       nM=3,modelPath,idF="siteid",dateF="date",obsF="pm25")

amodelPath=paste(dPath,"/models/t_",tids[1],"_models",sep="")
data("shd140401pcovs","bnd")
shd140401pcovs_part=shd140401pcovs[c(1:1000),]

cols=c("aod","ndvi","wnd_avg","monthAv")
parATimePredict(amodelPath,newPnts=shd140401pcovs_part,
       cols,bnd=bnd,c=2,prePath,idF="gid",ridF="rid")
## End(No test)




