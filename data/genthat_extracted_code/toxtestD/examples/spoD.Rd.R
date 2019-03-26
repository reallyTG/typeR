library(toxtestD)


### Name: spoD
### Title: spoD: Determine spontaneous response level or the optimal sample
###   size
### Aliases: spoD
### Keywords: design

### ** Examples


 #spontaneous lethality

  #1a: planning
  spoD(n=600,SL.p=3.5,SLmin=NA,SLmax=NA,bio.sd.p=2.008)
  spoD(n=600,SL.p=NA,SLmin=3,SLmax=4)
  spoD(n=600,SL.p=3.5,SLmin=NA,SLmax=NA,bio.sd.p=2.008,print.result="spoDa.txt")
  spoD(n=600,SL.p=3.5,SLmin=NA,SLmax=NA,bio.sd.p=2.008,print.result=FALSE)

  #1b: analysis
  SLdataset <- data.frame(n=rep(60,times=4),bearer=c(1,5,8,3))
  spoD(analysis=TRUE,SLdataset=SLdataset)
  spoD(analysis=TRUE,SLdataset=SLdataset,print.result="spoDb.txt")
  spoD(analysis=TRUE,SLdataset=SLdataset,print.result=FALSE)



