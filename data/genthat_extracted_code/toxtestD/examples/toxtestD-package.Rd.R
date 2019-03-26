library(toxtestD)


### Name: toxtestD-package
### Title: Experimental design for binary toxicity tests
### Aliases: toxtestD-package toxtestD
### Keywords: package design

### ** Examples


# == spoD ==
# determine spontaneous rate

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


# == setD ==
# determine sample size

  setD(nmax=350,SL.p=5.5,immunity.p=0,risk.type=2,target.EC=10,
       alpha.p=5,beta.p=20,plot="single")
  setD(nmax=350,SL.p=3,target.EC=5,plot="FALSE")
  setD(nmax=350,SL.p=3,target.EC=5,plot="FALSE",print.result="setD.txt")
  setD(nmax=350,SL.p=3,target.EC=5,plot="FALSE",print.result=FALSE)


# == doseD ==
# dose allocation

  DP <- data.frame(   name=c("neg.control",rep("substance",times=6)),
                      organisms=c(42,41,42,42,38,42,39),
                      death= c(1,3,40,20,12,40,13),
                      concentration=c(0.0,2.0,3.5,4.0,6.0,8.0,6.0),
                      unit=rep("mg/ml",times=7)  ) 
  doseD(DP=DP,immunity.p=4.7,SL.p=9,target.EC.p=c(15,30,40),
        nconc=9,text=TRUE,risk.type=1)
  doseD(DP=DP,immunity.p=4.7,SL.p=9,target.EC.p=c(15,30,40),
        nconc=9,text=TRUE,risk.type=2)
  doseD(DP=DP,immunity.p=4.7,SL.p=9,target.EC.p=c(15,30,40),
        nconc=9,text=TRUE,risk.type=3)
  doseD(DP=DP,immunity.p=4.7,SL.p=9,target.EC.p=c(15,30,40),
        nconc=9,text=TRUE,risk.type=3,print.result="doseD4.txt")
  doseD(DP=DP,immunity.p=4.7,SL.p=9,target.EC.p=c(15,30,40),
        nconc=9,text=TRUE,risk.type=3,print.result=FALSE)





