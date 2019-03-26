library(plsRglm)


### Name: plsRglm
### Title: Partial least squares Regression generalized linear models
### Aliases: plsRglm plsRglmmodel.default plsRglmmodel.formula PLS_glm
###   PLS_glm_formula
### Keywords: models regression

### ** Examples

data(Cornell)
XCornell<-Cornell[,1:7]
yCornell<-Cornell[,8]

modplsglm <- plsRglm(yCornell,XCornell,10,modele="pls-glm-gaussian")

#To retrieve the final GLR model on the PLS components
finalmod <- plsRglm(yCornell,XCornell,10,modele="pls-glm-gaussian")$FinalModel
#It is a glm object.
plot(finalmod)

## No test: 
#Cross validation
cv.modplsglm<-cv.plsRglm(yCornell,XCornell,6,NK=100,modele="pls-glm-gaussian")
res.cv.modplsglm<-cvtable(summary(cv.modplsglm))
plot(res.cv.modplsglm)

#If no model specified, classic PLSR model
modpls <- plsRglm(yCornell,XCornell,6)
modpls
modpls$tt
modpls$uscores
modpls$pp
modpls$Coeffs

#rm(list=c("XCornell","yCornell",modpls,cv.modplsglm,res.cv.modplsglm))
## End(No test)

data(aze_compl)
Xaze_compl<-aze_compl[,2:34]
yaze_compl<-aze_compl$y
plsRglm(yaze_compl,Xaze_compl,nt=10,modele="pls",MClassed=TRUE)$InfCrit
modpls <- plsRglm(yaze_compl,Xaze_compl,nt=10,modele="pls-glm-logistic",
MClassed=TRUE,pvals.expli=TRUE)
modpls
colSums(modpls$pvalstep)
modpls$Coeffsmodel_vals

plot(plsRglm(yaze_compl,Xaze_compl,4,modele="pls-glm-logistic")$FinalModel)
plsRglm(yaze_compl[-c(99,72)],Xaze_compl[-c(99,72),],4,
modele="pls-glm-logistic",pvals.expli=TRUE)$pvalstep
plot(plsRglm(yaze_compl[-c(99,72)],Xaze_compl[-c(99,72),],4,
modele="pls-glm-logistic",pvals.expli=TRUE)$FinalModel)
rm(list=c("Xaze_compl","yaze_compl","modpls"))


data(bordeaux)
Xbordeaux<-bordeaux[,1:4]
ybordeaux<-factor(bordeaux$Quality,ordered=TRUE)
modpls <- plsRglm(ybordeaux,Xbordeaux,10,modele="pls-glm-polr",pvals.expli=TRUE)
modpls
colSums(modpls$pvalstep)


XbordeauxNA<-Xbordeaux
XbordeauxNA[1,1] <- NA
modplsNA <- plsRglm(ybordeaux,XbordeauxNA,10,modele="pls-glm-polr",pvals.expli=TRUE)
modpls
colSums(modpls$pvalstep)
rm(list=c("Xbordeaux","XbordeauxNA","ybordeaux","modplsNA"))

## No test: 
data(pine)
Xpine<-pine[,1:10]
ypine<-pine[,11]
modpls1 <- plsRglm(ypine,Xpine,1)
modpls1$Std.Coeffs
modpls1$Coeffs
modpls4 <- plsRglm(ypine,Xpine,4)
modpls4$Std.Coeffs
modpls4$Coeffs
modpls4$PredictY[1,]
plsRglm(ypine,Xpine,4,dataPredictY=Xpine[1,])$PredictY[1,]

XpineNAX21 <- Xpine
XpineNAX21[1,2] <- NA
modpls4NA <- plsRglm(ypine,XpineNAX21,4)
modpls4NA$Std.Coeffs
modpls4NA$YChapeau[1,]
modpls4$YChapeau[1,]
modpls4NA$CoeffC
plsRglm(ypine,XpineNAX21,4,EstimXNA=TRUE)$XChapeau
plsRglm(ypine,XpineNAX21,4,EstimXNA=TRUE)$XChapeauNA

# compare pls-glm-gaussian with classic plsR
modplsglm4 <- plsRglm(ypine,Xpine,4,modele="pls-glm-gaussian")
cbind(modpls4$Std.Coeffs,modplsglm4$Std.Coeffs)

# without missing data
cbind(ypine,modpls4$ValsPredictY,modplsglm4$ValsPredictY)

# with missing data
modplsglm4NA <- plsRglm(ypine,XpineNAX21,4,modele="pls-glm-gaussian")
cbind((ypine),modpls4NA$ValsPredictY,modplsglm4NA$ValsPredictY)
rm(list=c("Xpine","ypine","modpls4","modpls4NA","modplsglm4","modplsglm4NA"))

data(fowlkes)
Xfowlkes <- fowlkes[,2:13]
yfowlkes <- fowlkes[,1]
modpls <- plsRglm(yfowlkes,Xfowlkes,4,modele="pls-glm-logistic",pvals.expli=TRUE)
modpls
colSums(modpls$pvalstep)
rm(list=c("Xfowlkes","yfowlkes","modpls"))


if(require(chemometrics)){
data(hyptis)
yhyptis <- factor(hyptis$Group,ordered=TRUE)
Xhyptis <- as.data.frame(hyptis[,c(1:6)])
options(contrasts = c("contr.treatment", "contr.poly"))
modpls2 <- plsRglm(yhyptis,Xhyptis,6,modele="pls-glm-polr")
modpls2$Coeffsmodel_vals
modpls2$InfCrit
modpls2$Coeffs
modpls2$Std.Coeffs

table(yhyptis,predict(modpls2$FinalModel,type="class"))
rm(list=c("yhyptis","Xhyptis","modpls2"))
}

dimX <- 24
Astar <- 6
dataAstar6 <- t(replicate(250,simul_data_UniYX(dimX,Astar)))
ysimbin1 <- dicho(dataAstar6)[,1]
Xsimbin1 <- dicho(dataAstar6)[,2:(dimX+1)]
modplsglm <- plsRglm(ysimbin1,Xsimbin1,10,modele="pls-glm-logistic")
modplsglm
cv.modplsglm <- cv.plsRglm(ysimbin1,Xsimbin1,nt=10,
modele="pls-glm-logistic",NK=100)
res.cv.modplsglm <- cvtable(summary(cv.modplsglm,MClassed=TRUE))
plot(res.cv.modplsglm) #defaults to type="CVMC"

rm(list=c("dimX","Astar","dataAstar6","ysimbin1","Xsimbin1","modplsglm","cv.modplsglm",
"res.cv.modplsglm"))
## End(No test)



