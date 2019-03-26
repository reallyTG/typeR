library(sptemExp)


### Name: parSpModel
### Title: Generation of Spatiotemporal Models by Bootstrap Aggregating
### Aliases: parSpModel
### Keywords: ~bootstrap aggregate ~ensemble learning

### ** Examples


## No test: 
# Example the PM2.5 data for Shandong

dPath=tempdir()
mPath=paste(dPath,"/models",sep="")
unlink(mPath,recursive = TRUE)
dir.create(mPath)

data("trainsample","bnd")

aform=paste0('logpm25 ~sx(rid,bs ="mrf",map =bnd)+sx(monthAv,bs="rw2")')
aform=paste0(aform,'+sx(ndvi,bs="rw2")+sx(aod,bs="rw2")+sx(wnd_avg,bs="rw2")')

formulaStrs=c(aform)

trainsample$tid=as.numeric(strftime(trainsample$date, format = "%j"))
trainsample$logpm25=log(trainsample$pm25)
tids=c(91)

parSpModel(trainsample,bnd,formulaStrs,tidF="tid",
   tids,c=2,nM=3,mPath,idF="siteid",dateF="date",obsF="pm25")

## End(No test)



