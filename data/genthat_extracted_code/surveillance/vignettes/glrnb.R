### R code from vignette source 'glrnb.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: setup
###################################################
library("surveillance")
options(SweaveHooks=list(fig=function() par(mar=c(4,4,2,0)+.5)))
options(width=70)
set.seed(247)

## create directory for plots
dir.create("plots", showWarnings=FALSE)


###################################################
### code chunk number 2: glrnb.Rnw:92-94
###################################################
getOption("SweaveHooks")[["fig"]]()
data(shadar)
plot(shadar,main="Number of salmonella hadar cases in Germany 2001-2006")


###################################################
### code chunk number 3: glrnb.Rnw:101-103
###################################################
# Simulate data
simData <- sim.pointSource(length=300,K=0.5,r=0.6,p=0.95)


###################################################
### code chunk number 4: glrnb.Rnw:106-107
###################################################
getOption("SweaveHooks")[["fig"]]()
plot(simData)


###################################################
### code chunk number 5: glrnb.Rnw:140-142
###################################################
getOption("SweaveHooks")[["fig"]]()
survObj <- algo.glrnb(shadar,control=list(range=105:295,alpha=0))
plot(survObj,startyear=2003)


###################################################
### code chunk number 6: glrnb.Rnw:161-164 (eval = FALSE)
###################################################
## control=list(range=range,c.ARL=5, 
##   mu0=NULL, alpha=0, Mtilde=1, M=-1, change="intercept",theta=NULL,
##   dir=c("inc","dec"),ret=c("cases","value"))


###################################################
### code chunk number 7: glrnb.Rnw:173-175 (eval = FALSE)
###################################################
## control=list(range=105:length(shadar$observed))
## algo.glrnb(disProgObj=shadar,control=control)


###################################################
### code chunk number 8: glrnb.Rnw:181-183 (eval = FALSE)
###################################################
## control=list(range=105:295,alpha=3)
## algo.glrnb(disProgObj=shadar,control=control)


###################################################
### code chunk number 9: glrnb.Rnw:191-194
###################################################
control=list(range=105:295,alpha=NULL)
surv <- algo.glrnb(shadar,control=control)
surv$control$alpha


###################################################
### code chunk number 10: glrnb.Rnw:205-207 (eval = FALSE)
###################################################
## control=list(range=105:295,mu0=list(S=2,trend=FALSE))
## algo.glrnb(disProgObj=shadar,control=control)


###################################################
### code chunk number 11: glrnb.Rnw:210-212
###################################################
control=list(range=105:295,mu0=list(S=2,trend=F,refit=T))
surv <- algo.glrnb(disProgObj=shadar,control=control)


###################################################
### code chunk number 12: glrnb.Rnw:217-219
###################################################
getOption("SweaveHooks")[["fig"]]()
plot(shadar)
with(surv$control,lines(mu0~range,lty=2,lwd=4,col=4))


###################################################
### code chunk number 13: glrnb.Rnw:225-226 (eval = FALSE)
###################################################
## surv$control$mu0Model


###################################################
### code chunk number 14: glrnb.Rnw:233-234
###################################################
estimateGLRNbHook


###################################################
### code chunk number 15: glrnb.Rnw:274-275
###################################################
coef(surv$control$mu0Model$fitted[[1]])


###################################################
### code chunk number 16: glrnb.Rnw:283-286
###################################################
control=list(range=105:295,alpha=0)
surv <- algo.glrnb(disProgObj=shadar,control=control)
table(surv$alarm)


###################################################
### code chunk number 17: glrnb.Rnw:291-295
###################################################
num <- rep(NA)
for (i in 1:6){
num[i] <- table(algo.glrnb(disProgObj=shadar,control=c(control,c.ARL=i))$alarm)[2]
}


###################################################
### code chunk number 18: glrnb.Rnw:319-321 (eval = FALSE)
###################################################
## control=list(range=105:295,theta=0.4)
## algo.glrnb(disProgObj=shadar,control=control)


###################################################
### code chunk number 19: glrnb.Rnw:326-328 (eval = FALSE)
###################################################
## control=list(range=105:295,theta=NULL)
## algo.glrnb(disProgObj=shadar,control=control)


###################################################
### code chunk number 20: glrnb.Rnw:336-338
###################################################
control=list(range=105:295,ret="cases",alpha=0)
surv2 <- algo.glrnb(disProgObj=shadar,control=control)


###################################################
### code chunk number 21: glrnb.Rnw:341-342
###################################################
getOption("SweaveHooks")[["fig"]]()
plot(surv2,startyear=2003)


###################################################
### code chunk number 22: glrnb.Rnw:352-354
###################################################
control=list(range=105:295,ret="cases",dir="dec",alpha=0)
surv3 <- algo.glrnb(disProgObj=shadar,control=control)


###################################################
### code chunk number 23: glrnb.Rnw:357-358
###################################################
getOption("SweaveHooks")[["fig"]]()
plot(surv3,startyear=2003)


