library(rcure)


### Name: rcure
### Title: Robust cure model
### Aliases: rcure

### ** Examples

library(survival)
library(smcure)
library(arm)
data(e1684)

# fit PH robust cure model
pd <- rcure(Surv(FAILTIME,FAILCENS)~TRT+SEX+AGE,cureform=~TRT+SEX+AGE,
data=e1684,model="ph",Var =FALSE,
method = "glm.fit", prior.mean = 0, prior.scale = NULL, prior.df = 1,
prior.mean.for.intercept = 0, prior.scale.for.intercept = NULL,
prior.df.for.intercept = 1, min.prior.scale = 1e-12,
scaled = FALSE, n.iter = 100, Warning=F)
printrcure(pd,Var = FALSE, ROC=FALSE)
# plot predicted survival curves for male with median centered age by treatment groups
predm=predictrcure(pd,newX=cbind(c(1,0),c(0,0),c(0.579,0.579)),
newZ=cbind(c(1,0),c(0,0),c(0.579,0.579)),model="ph")
plotpredictrcure(predm,model="ph")

# just a test: this should be identical to classical cure model
pd2 <- rcure(Surv(FAILTIME,FAILCENS)~TRT+SEX+AGE,cureform=~TRT+SEX+AGE,
data=e1684,model="ph",Var = FALSE,
method = "glm.fit", prior.mean = 0, prior.scale = Inf, prior.df = Inf,
prior.mean.for.intercept = 0, prior.scale.for.intercept = Inf,
prior.df.for.intercept = Inf, Warning=F)
printrcure(pd2,Var = FALSE, ROC=FALSE)
pd3 <- smcure(Surv(FAILTIME,FAILCENS)~TRT+SEX+AGE,cureform=~TRT+SEX+AGE,
data=e1684,model="ph",Var = FALSE)

data(bmt)
# fit AFT robust cure model
bmtfit <- rcure(formula = Surv(Time, Status) ~ TRT, cureform = ~TRT,
data = bmt, model = "aft", Var = FALSE,
method = "glm.fit", prior.mean = 0, prior.scale = NULL, prior.df = 1,
prior.mean.for.intercept = 0, prior.scale.for.intercept = NULL,
prior.df.for.intercept = 1, min.prior.scale = 1e-12,
scaled = TRUE, n.iter = 100, Warning=F, eva_mode="PO")
printrcure(bmtfit,Var = FALSE, ROC=FALSE)
## plot predicted Survival curves by treatment groups
predbmt=predictrcure(bmtfit,newX=c(0,1),newZ=c(0,1),model="aft")
plotpredictrcure(predbmt,model="aft")



