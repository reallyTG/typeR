library(plsRglm)


### Name: PLS_glm_wvc
### Title: Light version of PLS\_glm for cross validation purposes
### Aliases: PLS_glm_wvc
### Keywords: models regression

### ** Examples

data(Cornell)
XCornell<-Cornell[,1:7]
yCornell<-Cornell[,8]
PLS_glm_wvc(dataY=yCornell,dataX=XCornell,nt=3,modele="pls-glm-gaussian",
dataPredictY=XCornell[1,])
PLS_glm_wvc(dataY=yCornell,dataX=XCornell,nt=3,modele="pls-glm-family",
family=gaussian(),dataPredictY=XCornell[1,])
PLS_glm_wvc(dataY=yCornell[-1],dataX=XCornell[-1,],nt=3,modele="pls-glm-gaussian",
dataPredictY=XCornell[1,])
PLS_glm_wvc(dataY=yCornell[-1],dataX=XCornell[-1,],nt=3,modele="pls-glm-family",
family=gaussian(),dataPredictY=XCornell[1,])
rm("XCornell","yCornell")

## No test: 
## With an incomplete dataset (X[1,2] is NA)
data(pine)
ypine <- pine[,11]
data(XpineNAX21)
PLS_glm_wvc(dataY=ypine,dataX=XpineNAX21,nt=10,modele="pls-glm-gaussian")
rm("XpineNAX21","ypine")

data(pine)
Xpine<-pine[,1:10]
ypine<-pine[,11]
PLS_glm_wvc(ypine,Xpine,10,modele="pls")
PLS_glm_wvc(ypine,Xpine,10,modele="pls-glm-Gamma")
PLS_glm_wvc(ypine,Xpine,10,modele="pls-glm-family",family=Gamma())
PLS_glm_wvc(ypine,Xpine,10,modele="pls-glm-gaussian")
PLS_glm_wvc(ypine,Xpine,10,modele="pls-glm-family",family=gaussian(log))
PLS_glm_wvc(round(ypine),Xpine,10,modele="pls-glm-poisson")
PLS_glm_wvc(round(ypine),Xpine,10,modele="pls-glm-family",family=poisson(log))
rm(list=c("pine","ypine","Xpine"))


data(Cornell)
XCornell<-Cornell[,1:7]
yCornell<-Cornell[,8]
PLS_glm_wvc(yCornell,XCornell,10,modele="pls-glm-inverse.gaussian")
PLS_glm_wvc(yCornell,XCornell,10,modele="pls-glm-family",
family=inverse.gaussian())
rm(list=c("XCornell","yCornell"))


data(Cornell)
XCornell<-Cornell[,1:7]
yCornell<-Cornell[,8]
PLS_glm_wvc(dataY=yCornell,dataX=XCornell,nt=3,modele="pls-glm-gaussian",
dataPredictY=XCornell[1,])
PLS_glm_wvc(dataY=yCornell[-1],dataX=XCornell[-1,],nt=3,modele="pls-glm-gaussian",
dataPredictY=XCornell[1,])
rm("XCornell","yCornell")

data(aze_compl)
Xaze_compl<-aze_compl[,2:34]
yaze_compl<-aze_compl$y
PLS_glm(yaze_compl,Xaze_compl,10,modele="pls-glm-logistic",typeVC="none")$InfCrit
PLS_glm_wvc(yaze_compl,Xaze_compl,10,modele="pls-glm-logistic", keepcoeffs=TRUE)
rm("Xaze_compl","yaze_compl")
## End(No test)



