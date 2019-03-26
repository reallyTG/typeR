library(toxtestD)


### Name: doseD
### Title: doseD: Construction of an individual dose scheme
### Aliases: doseD
### Keywords: design

### ** Examples

 # calculation of an optimal dose scheme
 #  pretest results as dataframe (DP)
  DP <- data.frame(   name=c("neg.control",rep("substance",times=6)),
                      organisms=c(42,41,42,42,38,42,39),
                      death= c(1,3,40,20,12,40,13),
                      concentration=c(0.0,2.0,3.5,4.0,6.0,8.0,6.0),
                      unit=rep("mg/ml",times=7)  )
 # test design
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



