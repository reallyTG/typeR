### R code from vignette source 'Tutorial.Rnw'

###################################################
### code chunk number 1: preliminaries
###################################################
options(width=60)


###################################################
### code chunk number 2: loadMTB
###################################################
library(sme)
data(MTB)
names(MTB)


###################################################
### code chunk number 3: MTBrawPlot
###################################################
library(lattice)
print(xyplot(y ~ tme | ind,data=MTB[MTB$variable==6031,],
  xlab="Hour",ylab="Gene Expression"))


###################################################
### code chunk number 4: zeroSmoothingParameters
###################################################
fit <- sme(MTB[MTB$variable==6031,c("y","tme","ind")],
  lambda.mu=0,lambda.v=0)
plot(fit,type="model",xlab="Hour",ylab="Gene Expression")


###################################################
### code chunk number 5: successFlag
###################################################
fit$info


###################################################
### code chunk number 6: largeSmoothingParameters
###################################################
fit <- sme(MTB[MTB$variable==6031,c("y","tme","ind")],
  lambda.mu=1e7,lambda.v=1e7)
plot(fit,type="model",xlab="Hour",ylab="Gene Expression")


###################################################
### code chunk number 7: successFlag2
###################################################
fit$info


###################################################
### code chunk number 8: AIC
###################################################
fit <- sme(MTB[MTB$variable==6031,c("y","tme","ind")],
  criteria="AIC")
plot(fit,type="model",xlab="Hour",ylab="Gene Expression")


###################################################
### code chunk number 9: rawWithModel
###################################################
plot(fit,type="raw",showModelFits=TRUE,xlab="Hour",
  ylab="Gene Expression")


###################################################
### code chunk number 10: confidenceBand
###################################################
plot(fit,type="model",xlab="Hour",ylab="Gene Expression",
  showConfidenceBands=TRUE)


###################################################
### code chunk number 11: diagnostic
###################################################
plot(fit,type="diagnostic")


###################################################
### code chunk number 12: serial
###################################################
system.time(fits <- lapply(unique(MTB$variable),
  function(v) sme(MTB[MTB$variable==v,c("y","tme","ind")])))


###################################################
### code chunk number 13: parallel
###################################################
system.time(fits <- sme(MTB,numberOfThreads=3))


###################################################
### code chunk number 14: visualiseInflammatory
###################################################
data(inflammatory)
plot(y~tme,data=inflammatory,xlab="Day",
  ylab="Gene Expression")
for(ind in inflammatory$ind) lines(y~tme,
  data=inflammatory[inflammatory$ind==ind,],
  lty="dashed")


###################################################
### code chunk number 15: slowInflammatory
###################################################
system.time(fit <- sme(inflammatory,
  deltaNM=0.1))
plot(fit,xlab="Day",ylab="Gene Expression")


###################################################
### code chunk number 16: fastInflammatory
###################################################
my.knots <- seq(min(inflammatory$tme),max(inflammatory$tme),
  length.out=7)[-c(1,7)]
my.knots
system.time(fit <- sme(inflammatory,knots=my.knots,
  deltaNM=0.1))
plot(fit,xlab="Day",ylab="Gene Expression")


