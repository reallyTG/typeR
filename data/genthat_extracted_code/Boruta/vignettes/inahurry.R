### R code from vignette source 'inahurry.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: setGeneration
###################################################
set.seed(17)
data(iris)
irisE<-cbind(
 setNames(
  data.frame(apply(iris[,-5],2,sample)),
  sprintf("Nonsense%d",1:4)
 ),
 iris
)


###################################################
### code chunk number 2: Boruta
###################################################
library(Boruta)
Boruta(Species~.,data=irisE)->BorutaOnIrisE
BorutaOnIrisE


###################################################
### code chunk number 3: BorutaReduendancy
###################################################
irisR<-cbind(
 irisE,
 SpoilerFeature=iris$Species
)
Boruta(Species~.,data=irisR)


###################################################
### code chunk number 4: BorutaPlots
###################################################
par(mfrow=c(1,2))
plot(BorutaOnIrisE)
plotImpHistory(BorutaOnIrisE)


###################################################
### code chunk number 5: attStats
###################################################
attStats(BorutaOnIrisE)


###################################################
### code chunk number 6: BorutaFe
###################################################
library(rFerns)
Boruta(Species~.,data=irisE,getImp=getImpFerns)


