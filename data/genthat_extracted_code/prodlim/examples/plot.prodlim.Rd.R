library(prodlim)


### Name: plot.prodlim
### Title: Plotting event probabilities over time
### Aliases: plot.prodlim lines.prodlim
### Keywords: survival

### ** Examples

## simulate right censored data from a two state model 
set.seed(100)
dat <- SimSurv(100)
# with(dat,plot(Hist(time,status)))

### marginal Kaplan-Meier estimator
kmfit <- prodlim(Hist(time, status) ~ 1, data = dat)
plot(kmfit)

plot(kmfit,timeconverter="years2months")

# change time range
plot(kmfit,xlim=c(0,4))

# change scale of y-axis
plot(kmfit,percent=FALSE)

# mortality instead of survival
plot(kmfit,type="cuminc")

# change axis label and position of ticks
plot(kmfit,
     xlim=c(0,10),
     axis1.at=seq(0,10,1),
     axis1.labels=0:10,
     xlab="Years",
     axis2.las=2,
     atrisk.at=seq(0,10,2.5),
     atrisk.title="")

# change background color
plot(kmfit,
     xlim=c(0,10),
     confint.citype="shadow",
     col=1,
     axis1.at=0:10,
     axis1.labels=0:10,
     xlab="Years",
     axis2.las=2,
     atrisk.at=seq(0,10,2.5),
     atrisk.title="",
     background=TRUE,
     background.fg="white",
     background.horizontal=seq(0,1,.25/2),
     background.vertical=seq(0,10,2.5),
     background.bg=c("gray88"))

# change type of confidence limits
plot(kmfit,
     xlim=c(0,10),
     confint.citype="dots",
     col=4,
     background=TRUE,
     background.bg=c("white","gray88"),
     background.fg="gray77",
     background.horizontal=seq(0,1,.25/2),
     background.vertical=seq(0,10,2))


### Kaplan-Meier in discrete strata
kmfitX <- prodlim(Hist(time, status) ~ X1, data = dat)
plot(kmfitX)
# move legend
plot(kmfitX,legend.x="bottomleft",atRisk.cex=1.3,
     atrisk.title="No. subjects")

## Control the order of strata
## since version 1.5.1 prodlim does  obey the order of
## factor levels
dat$group <- factor(cut(dat$X2,c(-Inf,0,0.5,Inf)),
                    labels=c("High","Intermediate","Low"))
kmfitG <- prodlim(Hist(time, status) ~ group, data = dat)
plot(kmfitG)

## relevel 
dat$group2 <- factor(cut(dat$X2,c(-Inf,0,0.5,Inf)),
                     levels=c("(0.5, Inf]","(0,0.5]","(-Inf,0]"),
                     labels=c("Low","Intermediate","High"))
kmfitG2 <- prodlim(Hist(time, status) ~ group2, data = dat)
plot(kmfitG2)

# add log-rank test to legend
plot(kmfitX,
     atRisk.cex=1.3,
     logrank=TRUE,
     legend.x="topright",
     atrisk.title="at-risk")

# change atrisk labels
plot(kmfitX,
     legend.x="bottomleft",
     atrisk.title="Patients",
     atrisk.cex=0.9,
     atrisk.labels=c("X1=0","X1=1"))

# multiple categorical factors

kmfitXG <- prodlim(Hist(time,status)~X1+group2,data=dat)
plot(kmfitXG,select=1:2)

### Kaplan-Meier in continuous strata
kmfitX2 <- prodlim(Hist(time, status) ~ X2, data = dat)
plot(kmfitX2,xlim=c(0,10))

# specify values of X2 for which to show the curves 
plot(kmfitX2,xlim=c(0,10),newdata=data.frame(X2=c(-1.8,0,1.2)))

### Cluster-correlated data
library(survival)
cdat <- cbind(SimSurv(20),patnr=sample(1:5,size=20,replace=TRUE))
kmfitC <- prodlim(Hist(time, status) ~ cluster(patnr), data = cdat)
plot(kmfitC)
plot(kmfitC,atrisk.labels=c("Units","Patients"))

kmfitC2 <- prodlim(Hist(time, status) ~ X1+cluster(patnr), data = cdat)
plot(kmfitC2)
plot(kmfitC2,atrisk.labels=c("Teeth","Patients","Teeth","Patients"),
     atrisk.col=c(1,1,2,2))


### Cluster-correlated data with strata
n = 50
foo = runif(n)
bar = rexp(n)
baz = rexp(n,1/2)
d = stack(data.frame(foo,bar,baz))
d$cl = sample(10, 3*n, replace=TRUE)
fit = prodlim(Surv(values) ~ ind + cluster(cl), data=d)
plot(fit)


## simulate right censored data from a competing risk model 
datCR <- SimCompRisk(100)
with(datCR,plot(Hist(time,event)))

### marginal Aalen-Johansen estimator
ajfit <- prodlim(Hist(time, event) ~ 1, data = datCR)
plot(ajfit) # same as plot(ajfit,cause=1)

# cause 2
plot(ajfit,cause=2)

# both in one
plot(ajfit,cause=1)
plot(ajfit,cause=2,add=TRUE,col=2)

### stacked plot

plot(ajfit,cause="stacked",select=2)

### stratified Aalen-Johansen estimator
ajfitX1 <- prodlim(Hist(time, event) ~ X1, data = datCR)
plot(ajfitX1)

## add total number at-risk to a stratified curve
ttt = 1:10
plot(ajfitX1,atrisk.at=ttt,col=2:3)
plot(ajfit,add=TRUE,col=1)
atRisk(ajfit,newdata=datCR,col=1,times=ttt,line=3,labels="Total")


## stratified Aalen-Johansen estimator in nearest neighborhoods
## of a continuous variable
ajfitX <- prodlim(Hist(time, event) ~ X1+X2, data = datCR)
plot(ajfitX,newdata=data.frame(X1=c(1,1,0),X2=c(4,10,10)))
plot(ajfitX,newdata=data.frame(X1=c(1,1,0),X2=c(4,10,10)),cause=2)

## stacked plot

plot(ajfitX,
     newdata=data.frame(X1=0,X2=0.1),
     cause="stacked",
     legend.title="X1=0,X2=0.1",
     legend.legend=paste("cause:",getStates(ajfitX$model.response)),
     plot.main="Subject specific stacked plot")
 



