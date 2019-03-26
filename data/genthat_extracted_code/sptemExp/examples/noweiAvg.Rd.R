library(sptemExp)


### Name: noweiAvg
### Title: Averages over the Ensemble Predictions of Mixed Models (No
###   weighted)
### Aliases: noweiAvg
### Keywords: ensemble learning machine learning

### ** Examples


# Generate the prediction dataset, but you can use parATimePredict function
# to make the prediction in application

dPath=tempdir()
pPath=paste(dPath,"/preds",sep="")
unlink(pPath, recursive=TRUE, force=TRUE)
dir.create(pPath)

nr=2000
for(i in c(1:80)){ # i =1
  dset=data.frame(gid=c(1:nr),rid=sample(c(1:30),size=nr,replace=TRUE))
  dset$pre=dset$gid%%80+rnorm(nr,mean=5,sd=9)+runif(nr,0,1)
  afile=paste(pPath,"/m_",i,".csv",sep="")
  write.csv(dset,file=afile,row.names = FALSE)
}
result=noweiAvg(pPath, preStr="pre",idStr="gid",dateStr="gid")





