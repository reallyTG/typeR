## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ----install, eval=FALSE-------------------------------------------------
#  install.packages("PDN", repos = "https://cran.us.r-project.org")

## ----load, echo=TRUE-----------------------------------------------------
library(PDN)

## ----help, eval=FALSE----------------------------------------------------
#  help(package = "PDN")

## ----comorbidity_data, echo=TRUE-----------------------------------------
summary(comorbidity_data)

## ----demographic_data, echo=TRUE-----------------------------------------
summary(demographic_data)

## ----survival_data, echo=TRUE--------------------------------------------
summary(survival_data)

## ----hist, echo=FALSE, fig.height = 3, fig.width = 5, fig.align = "center"----
abc = comorbidity_data$CMTHY - comorbidity_data$HTN
abc = abc[!is.na(abc)]
bins=seq(floor(min(abc)),ceiling(max(abc)+1000),500)
hist(abc,breaks=bins,
     yaxt="n",
     xaxt="n",
     main = "",
     ylab="Number of Patients",                         
     xlab="Time difference between CMTHY and HTN in days", 
     col="grey"                                      
)
axis(side=2, at=axTicks(2), labels=formatC(axTicks(2), format="d", big.mark=','))
axis(side=1, at=axTicks(1), labels=formatC(axTicks(1), format="d", big.mark=','))
box()

## ----datecut, echo=TRUE, warning=FALSE-----------------------------------
k1 = datecut(comorbidity_data,survival_data[,1],survival_data[,2])
k1[1:20]

## ----network, echo=TRUE--------------------------------------------------
a = buildnetworks(comorbidity_data,k1)
a[1:10,1:10]

## ----plotnetwork, echo=FALSE, fig.align="center", fig.height=3, fig.width=5----
datark = t(apply(comorbidity_data,1,rank))
dak = sort(datark[1,])
draw.PDN.circle(a[1,],dak)
title("PDN for Patient 1")

## ----plotnetwork2, echo=FALSE, fig.align="center", fig.height=4, fig.width=5----
nn = names(comorbidity_data)
draw.PDN(a[7,],nn)

## ----plotnetwork1, echo=FALSE, fig.height = 5, fig.width = 7, fig.align = "center"----
par(mfrow=c(4,5))
for(i in 1 : 20){
  dak = apply(datark,2,sort)
  draw.PDN.circle(a[i,],dak[i,])
  title(main=paste("Patient",i))
}

## ----plotnetwork3, echo=FALSE, fig.align="center", fig.height=5, fig.width=7, warning=FALSE----
##Clustering Example
k1 = datecut(comorbidity_data,survival_data[,1],survival_data[,2])
a = buildnetworks(comorbidity_data,k1)
datark = t(apply(comorbidity_data,1,rank))
require(survival)
zsq = NULL
for(i in 1:ncol(a)){
  a1 = (summary(coxph(Surv(as.numeric(survival_data[,1]),survival_data[,2]) ~ a[,i],
  data=as.data.frame(a)))$coefficient[,4])^2
  zsq = cbind(zsq,a1)
}
zsq = as.numeric(zsq)
wi=zsq/sum(zsq,na.rm=TRUE)
wi[wi<10^ -3]=10^ -3
wi[is.na(wi)]=10^ -3
#weighted matrix
wa = NULL
for(i in 1:ncol(a)){
 wa = cbind(wa,a[,i]*wi[i])
}
#PCA
pr.out=prcomp(wa)
x.svd=svd(wa)
x.score1 <- wa %*% x.svd$v
x.score2 <- x.svd$u %*% diag(x.svd$d)
##HC cluster using the first 8 PCA scores
dp<-dist(x.score2[,1:8])
hcp<-hclust(dp, method="ward.D")
##Plot Network
s1=rev(sort(apply(a[cutree(hcp,3)==3,],2,mean)))[1:50]
dak = sort(apply(datark[cutree(hcp,3)==3,],2,mean,na.rm=TRUE))
names(dak) = unlist(strsplit(names(dak),"DAT"))
draw.PDN.cluster(s1,dak)

## ----glmnet, echo=TRUE---------------------------------------------------
x = cbind(!is.na(comorbidity_data),a)
x[1:10,1:10]

## ----glmnet1, echo=TRUE--------------------------------------------------
require(survival)
require(glmnet)
y=Surv(survival_data[,1],survival_data[,2])
glm1 = cv.glmnet(x,y,family="cox",alpha=0.8)
b = glmnet(x,y,family="cox",alpha=0.8,lambda=c(glm1$lambda.min,glm1$lambda.1se))$beta
b[1:20,]

## ----glmnet2, eval=FALSE-------------------------------------------------
#  isel = b[,2]!=0
#  bcox = coxph(y~.,data=data.frame(x[,isel]))
#  step1 = step(bcox)
#  step1$anova

