library(plsRglm)


### Name: cv.plsRglm
### Title: Partial least squares regression glm models with k-fold cross
###   validation
### Aliases: cv.plsRglm cv.plsRglmmodel.default cv.plsRglmmodel.formula
###   PLS_glm_kfoldcv PLS_glm_kfoldcv_formula
### Keywords: models regression

### ** Examples

data(Cornell)
XCornell<-Cornell[,1:7]
yCornell<-Cornell[,8]
bbb <- cv.plsRglm(dataY=yCornell,dataX=XCornell,nt=10)
(sum1<-summary(bbb))
cvtable(sum1)

bbb2 <- cv.plsRglm(dataY=yCornell,dataX=XCornell,nt=3,
modele="pls-glm-family",family=gaussian(),K=12)
(sum2<-summary(bbb2))
cvtable(sum2)

## No test: 
#random=TRUE is the default to randomly create folds for repeated CV
bbb3 <- cv.plsRglm(dataY=yCornell,dataX=XCornell,nt=3,
modele="pls-glm-family",family=gaussian(),K=6,NK=10)
(sum3<-summary(bbb3))
plot(cvtable(sum3))

data(aze_compl)
Xaze_compl<-aze_compl[,2:34]
yaze_compl<-aze_compl$y
bbb <- cv.plsRglm(yaze_compl,Xaze_compl,nt=10,K=10,modele="pls",keepcoeffs=TRUE)

#For Jackknife computations
kfolds2coeff(bbb)
bbb2 <- cv.plsRglm(yaze_compl,Xaze_compl,nt=10,K=10,modele="pls-glm-family",
family=binomial(probit),keepcoeffs=TRUE)
bbb2 <- cv.plsRglm(yaze_compl,Xaze_compl,nt=10,K=10,
modele="pls-glm-logistic",keepcoeffs=TRUE)
summary(bbb,MClassed=TRUE)
summary(bbb2,MClassed=TRUE)
kfolds2coeff(bbb2)

kfolds2Chisqind(bbb2)
kfolds2Chisq(bbb2)
summary(bbb2)
rm(list=c("Xaze_compl","yaze_compl","bbb","bbb2"))



data(pine)
Xpine<-pine[,1:10]
ypine<-pine[,11]
bbb <- cv.plsRglm(dataY=round(ypine),dataX=Xpine,nt=10,modele="pls-glm-family",
family=poisson(log),K=10,keepcoeffs=TRUE,keepfolds=FALSE)
bbb <- cv.plsRglm(dataY=round(ypine),dataX=Xpine,nt=10,
modele="pls-glm-poisson",K=10,keepcoeffs=TRUE,keepfolds=FALSE)

#For Jackknife computations
kfolds2coeff(bbb)
boxplot(kfolds2coeff(bbb)[,1])

kfolds2Chisqind(bbb)
kfolds2Chisq(bbb)
summary(bbb)
PLS_lm(ypine,Xpine,10,typeVC="standard")$InfCrit

XpineNAX21 <- Xpine
XpineNAX21[1,2] <- NA
bbb2 <- cv.plsRglm(dataY=round(ypine),dataX=XpineNAX21,nt=10,
modele="pls-glm-family",family=poisson(log),K=10,keepcoeffs=TRUE,keepfolds=FALSE)
bbb2 <- cv.plsRglm(dataY=round(ypine),dataX=XpineNAX21,nt=10,
modele="pls-glm-poisson",K=10,keepcoeffs=TRUE,keepfolds=FALSE)

#For Jackknife computations
kfolds2coeff(bbb2)
boxplot(kfolds2coeff(bbb2)[,1])

kfolds2Chisqind(bbb2)
kfolds2Chisq(bbb2)
summary(bbb2)
PLS_lm(ypine,XpineNAX21,10,typeVC="standard")$InfCrit
rm(list=c("Xpine","XpineNAX21","ypine","bbb","bbb2"))



data(pine)
Xpine<-pine[,1:10]
ypine<-pine[,11]
bbb <- cv.plsRglm(dataY=ypine,dataX=Xpine,nt=10,modele="pls-glm-family",
family=Gamma,K=10,keepcoeffs=TRUE,keepfolds=FALSE)
bbb <- cv.plsRglm(dataY=ypine,dataX=Xpine,nt=10,modele="pls-glm-Gamma",
K=10,keepcoeffs=TRUE,keepfolds=FALSE)

#For Jackknife computations
kfolds2coeff(bbb)
boxplot(kfolds2coeff(bbb)[,1])

kfolds2Chisqind(bbb)
kfolds2Chisq(bbb)
summary(bbb)
PLS_lm(ypine,Xpine,10,typeVC="standard")$InfCrit

XpineNAX21 <- Xpine
XpineNAX21[1,2] <- NA
bbb2 <- cv.plsRglm(dataY=ypine,dataX=XpineNAX21,nt=10,
modele="pls-glm-family",family=Gamma(),K=10,keepcoeffs=TRUE,keepfolds=FALSE)
bbb2 <- cv.plsRglm(dataY=ypine,dataX=XpineNAX21,nt=10,
modele="pls-glm-Gamma",K=10,keepcoeffs=TRUE,keepfolds=FALSE)

#For Jackknife computations
kfolds2coeff(bbb2)
boxplot(kfolds2coeff(bbb2)[,1])

kfolds2Chisqind(bbb2)
kfolds2Chisq(bbb2)
summary(bbb2)
PLS_lm(ypine,XpineNAX21,10,typeVC="standard")$InfCrit
rm(list=c("Xpine","XpineNAX21","ypine","bbb","bbb2"))



data(Cornell)
XCornell<-Cornell[,1:7]
yCornell<-Cornell[,8]
bbb <- cv.plsRglm(dataY=yCornell,dataX=XCornell,nt=10,NK=1,modele="pls")
summary(bbb)

cv.plsRglm(dataY=yCornell,dataX=XCornell,nt=3,modele="pls-glm-inverse.gaussian",K=12)
cv.plsRglm(dataY=yCornell,dataX=XCornell,nt=3,modele="pls-glm-family",
family=inverse.gaussian,K=12)
cv.plsRglm(dataY=yCornell,dataX=XCornell,nt=3,modele="pls-glm-inverse.gaussian",K=6,
NK=2)$results_kfolds
cv.plsRglm(dataY=yCornell,dataX=XCornell,nt=3,modele="pls-glm-family",family=inverse.gaussian(),
K=6,NK=2)$results_kfolds
cv.plsRglm(dataY=yCornell,dataX=XCornell,nt=3,modele="pls-glm-inverse.gaussian",K=6,
NK=2)$results_kfolds
cv.plsRglm(dataY=yCornell,dataX=XCornell,nt=3,modele="pls-glm-family",
family=inverse.gaussian(link = "1/mu^2"),K=6,NK=2)$results_kfolds

bbb2 <- cv.plsRglm(dataY=yCornell,dataX=XCornell,nt=10,
modele="pls-glm-inverse.gaussian",keepcoeffs=TRUE)

#For Jackknife computations
kfolds2coeff(bbb2)
boxplot(kfolds2coeff(bbb2)[,1])

kfolds2Chisqind(bbb2)
kfolds2Chisq(bbb2)
summary(bbb2)
PLS_lm(yCornell,XCornell,10,typeVC="standard")$InfCrit
rm(list=c("XCornell","yCornell","bbb","bbb2"))
## End(No test)
data(Cornell)
bbb <- cv.plsRglm(Y~.,data=Cornell,nt=10,NK=1,modele="pls")
summary(bbb)

cv.plsRglm(Y~.,data=Cornell,nt=3,modele="pls-glm-family",family=gaussian(),K=12)

## No test: 
cv.plsRglm(Y~.,data=Cornell,nt=3,modele="pls-glm-family",family=gaussian(),K=6,
NK=2,random=TRUE,keepfolds=TRUE)$results_kfolds

#Different ways of model specifications
cv.plsRglm(Y~.,data=Cornell,nt=3,modele="pls-glm-family",family=gaussian(),K=6,
NK=2)$results_kfolds
cv.plsRglm(Y~.,data=Cornell,nt=3,modele="pls-glm-family",family=gaussian,
K=6,NK=2)$results_kfolds
cv.plsRglm(Y~.,data=Cornell,nt=3,modele="pls-glm-family",family=gaussian(),
K=6,NK=2)$results_kfolds
cv.plsRglm(Y~.,data=Cornell,nt=3,modele="pls-glm-family",family=gaussian(link=log),
K=6,NK=2)$results_kfolds

bbb2 <- cv.plsRglm(Y~.,data=Cornell,nt=10,
modele="pls-glm-gaussian",keepcoeffs=TRUE)
bbb2 <- cv.plsRglm(Y~.,data=Cornell,nt=3,modele="pls-glm-family",
family=gaussian(link=log),K=6,keepcoeffs=TRUE)

#For Jackknife computations
kfolds2coeff(bbb2)
boxplot(kfolds2coeff(bbb2)[,1])

kfolds2Chisqind(bbb2)
kfolds2Chisq(bbb2)
summary(bbb2)
PLS_lm_formula(Y~.,data=Cornell,10,typeVC="standard")$InfCrit
rm(list=c("bbb","bbb2"))


data(pine)
bbb <- cv.plsRglm(x11~.,data=pine,nt=10,modele="pls-glm-family",
family=gaussian(log),K=10,keepcoeffs=TRUE,keepfolds=FALSE)
bbb <- cv.plsRglm(x11~.,data=pine,nt=10,modele="pls-glm-family",family=gaussian(),
K=10,keepcoeffs=TRUE,keepfolds=FALSE)

#For Jackknife computations
kfolds2coeff(bbb)
boxplot(kfolds2coeff(bbb)[,1])

kfolds2Chisqind(bbb)
kfolds2Chisq(bbb)
summary(bbb)
PLS_lm_formula(x11~.,data=pine,nt=10,typeVC="standard")$InfCrit

pineNAX21 <- pine
pineNAX21[1,2] <- NA
bbb2 <- cv.plsRglm(x11~.,data=pineNAX21,nt=10,
modele="pls-glm-family",family=gaussian(log),K=10,keepcoeffs=TRUE,keepfolds=FALSE)
bbb2 <- cv.plsRglm(x11~.,data=pineNAX21,nt=10,
modele="pls-glm-gaussian",K=10,keepcoeffs=TRUE,keepfolds=FALSE)

#For Jackknife computations
kfolds2coeff(bbb2)
boxplot(kfolds2coeff(bbb2)[,1])

kfolds2Chisqind(bbb2)
kfolds2Chisq(bbb2)
summary(bbb2)
PLS_lm_formula(x11~.,data=pineNAX21,nt=10,typeVC="standard")$InfCrit
rm(list=c("pineNAX21","bbb","bbb2"))


data(aze_compl)
bbb <- cv.plsRglm(y~.,data=aze_compl,nt=10,K=10,modele="pls",
keepcoeffs=TRUE)

#For Jackknife computations
kfolds2coeff(bbb)
bbb2 <- cv.plsRglm(y~.,data=aze_compl,nt=3,K=10,
modele="pls-glm-family",family=binomial(probit),keepcoeffs=TRUE)
bbb2 <- cv.plsRglm(y~.,data=aze_compl,nt=3,K=10,
modele="pls-glm-logistic",keepcoeffs=TRUE)
summary(bbb,MClassed=TRUE)
summary(bbb2,MClassed=TRUE)
kfolds2coeff(bbb2)

kfolds2Chisqind(bbb2)
kfolds2Chisq(bbb2)
summary(bbb2)
rm(list=c("bbb","bbb2"))



data(pine)
bbb <- cv.plsRglm(round(x11)~.,data=pine,nt=10,
modele="pls-glm-family",family=poisson(log),K=10,keepcoeffs=TRUE,keepfolds=FALSE)
bbb <- cv.plsRglm(round(x11)~.,data=pine,nt=10,
modele="pls-glm-poisson",K=10,keepcoeffs=TRUE,keepfolds=FALSE)

#For Jackknife computations
kfolds2coeff(bbb)
boxplot(kfolds2coeff(bbb)[,1])

kfolds2Chisqind(bbb)
kfolds2Chisq(bbb)
summary(bbb)
PLS_lm_formula(x11~.,data=pine,10,typeVC="standard")$InfCrit

pineNAX21 <- pine
pineNAX21[1,2] <- NA
bbb2 <- cv.plsRglm(round(x11)~.,data=pineNAX21,nt=10,
modele="pls-glm-family",family=poisson(log),K=10,keepcoeffs=TRUE,keepfolds=FALSE)
bbb2 <- cv.plsRglm(round(x11)~.,data=pineNAX21,nt=10,
modele="pls-glm-poisson",K=10,keepcoeffs=TRUE,keepfolds=FALSE)

#For Jackknife computations
kfolds2coeff(bbb2)
boxplot(kfolds2coeff(bbb2)[,1])

kfolds2Chisqind(bbb2)
kfolds2Chisq(bbb2)
summary(bbb2)
PLS_lm_formula(x11~.,data=pineNAX21,10,typeVC="standard")$InfCrit
rm(list=c("pineNAX21","bbb","bbb2"))



data(pine)
bbb <- cv.plsRglm(x11~.,data=pine,nt=10,modele="pls-glm-family",
family=Gamma,K=10,keepcoeffs=TRUE,keepfolds=FALSE)
bbb <- cv.plsRglm(x11~.,data=pine,nt=10,modele="pls-glm-Gamma",
K=10,keepcoeffs=TRUE,keepfolds=FALSE)

#For Jackknife computations
kfolds2coeff(bbb)
boxplot(kfolds2coeff(bbb)[,1])

kfolds2Chisqind(bbb)
kfolds2Chisq(bbb)
summary(bbb)
PLS_lm_formula(x11~.,data=pine,10,typeVC="standard")$InfCrit

pineNAX21 <- pine
pineNAX21[1,2] <- NA
bbb2 <- cv.plsRglm(x11~.,data=pineNAX21,nt=10,
modele="pls-glm-family",family=Gamma(),K=10,keepcoeffs=TRUE,keepfolds=FALSE)
bbb2 <- cv.plsRglm(x11~.,data=pineNAX21,nt=10,
modele="pls-glm-Gamma",K=10,keepcoeffs=TRUE,keepfolds=FALSE)

#For Jackknife computations
kfolds2coeff(bbb2)
boxplot(kfolds2coeff(bbb2)[,1])

kfolds2Chisqind(bbb2)
kfolds2Chisq(bbb2)
summary(bbb2)
PLS_lm_formula(x11~.,data=pineNAX21,10,typeVC="standard")$InfCrit
rm(list=c("pineNAX21","bbb","bbb2"))



data(Cornell)
bbb <- cv.plsRglm(Y~.,data=Cornell,nt=10,NK=1,modele="pls")
summary(bbb)

cv.plsRglm(Y~.,data=Cornell,nt=3,
modele="pls-glm-inverse.gaussian",K=12)
cv.plsRglm(Y~.,data=Cornell,nt=3,modele="pls-glm-family",family=inverse.gaussian,K=12)
cv.plsRglm(Y~.,data=Cornell,nt=3,modele="pls-glm-inverse.gaussian",K=6,
NK=2)$results_kfolds
cv.plsRglm(Y~.,data=Cornell,nt=3,modele="pls-glm-family",
family=inverse.gaussian(),K=6,NK=2)$results_kfolds
cv.plsRglm(Y~.,data=Cornell,nt=3,modele="pls-glm-inverse.gaussian",K=6,NK=2)$results_kfolds
cv.plsRglm(Y~.,data=Cornell,nt=3,modele="pls-glm-family",
family=inverse.gaussian(link = "1/mu^2"),K=6,NK=2)$results_kfolds

bbb2 <- cv.plsRglm(Y~.,data=Cornell,nt=10,
modele="pls-glm-inverse.gaussian",keepcoeffs=TRUE)

#For Jackknife computations
kfolds2coeff(bbb2)
boxplot(kfolds2coeff(bbb2)[,1])

kfolds2Chisqind(bbb2)
kfolds2Chisq(bbb2)
summary(bbb2)
PLS_lm_formula(Y~.,data=Cornell,10,typeVC="standard")$InfCrit
rm(list=c("bbb","bbb2"))


data(bordeaux)
bbb <- cv.plsRglm(Quality~.,data=bordeaux,10,
modele="pls-glm-polr",K=7)
summary(bbb)

bordeauxNA<-bordeaux
bordeauxNA[1,1] <- NA
bbbNA <- cv.plsRglm(Quality~Temperature+Sunshine+Heat+Rain,
data=bordeauxNA,10,modele="pls-glm-polr",K=10)
summary(bbbNA)
rm(list=c("bbb","bbbNA"))

bbb2 <- cv.plsRglm(Quality~.,data=bordeaux,nt=2,K=7,
modele="pls-glm-polr",method="logistic")
bbb3 <- cv.plsRglm(Quality~.,data=bordeaux,nt=2,K=7,
modele="pls-glm-polr",method="probit")
bbb4 <- cv.plsRglm(Quality~.,data=bordeaux,nt=2,K=7,
modele="pls-glm-polr",method="cloglog")
bbb5 <- cv.plsRglm(Quality~.,data=bordeaux,nt=2,K=7,
modele="pls-glm-polr",method="cauchit")

summary(bbb2)
summary(bbb3)
summary(bbb4)
summary(bbb5)
rm(list=c("bbb","bbbNA","bbb2","bbb3","bbb4","bbb5"))
## End(No test)



