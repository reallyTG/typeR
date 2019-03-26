library(rocNIT)


### Name: rocNIT
### Title: Non-Inferiority Test for Paired ROC Curves
### Aliases: rocNIT
### Keywords: Non-inferiority test, receiver operating characteristic (ROC)

### ** Examples

VAL1=c(rnorm(50,mean=0),rnorm(50,mean=0)+0.5)
VAL2=c(rnorm(50,mean=0),rnorm(50,mean=0)+1)
GOLD=rep(1:2,each=50)
data=data.frame(GOLD,VAL1,VAL2)
rocNIT(BNO=200,DATA=data,cVAL1=2,cVAL2=3,cGOLD=1,DELTA=0.05,ALPHA=0.05,seed=2016)



