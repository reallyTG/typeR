library(plsRglm)


### Name: predict.plsRglmmodel
### Title: Print method for plsRglm models
### Aliases: predict.plsRglmmodel
### Keywords: methods predict

### ** Examples

data(pine)
Xpine<-pine[,1:10]
ypine<-pine[,11]
data(pine_sup)
Xpine_sup<-pine_sup[,1:10]
Xpine_supNA<-Xpine_sup
Xpine_supNA[1,1]<-NA

modpls=plsRglm(dataY=ypine,dataX=Xpine,nt=6,modele="pls-glm-family",family="gaussian")
modplsform=plsRglm(x11~.,data=pine,nt=6,modele="pls-glm-family",family="gaussian")
modpls2=plsRglm(dataY=ypine,dataX=Xpine,nt=6,modele="pls-glm-family",
dataPredictY=Xpine_sup,family="gaussian")
modpls2NA=plsRglm(dataY=ypine,dataX=Xpine,nt=6,modele="pls-glm-family",
dataPredictY=Xpine_supNA,family="gaussian")

#Identical to predict(modpls,type="link") or modpls$Std.ValsPredictY
cbind(modpls$Std.ValsPredictY,modplsform$Std.ValsPredictY,
predict(modpls),predict(modplsform))

#Identical to predict(modpls,type="response") or modpls$ValsPredictY
cbind(modpls$ValsPredictY,modplsform$ValsPredictY,
predict(modpls,type="response"),predict(modplsform,type="response"))

#Identical to modpls$ttPredictY
predict(modpls,type="scores")
predict(modplsform,type="scores")

## No test: 
#Identical to modpls2$ValsPredictY
cbind(predict(modpls,newdata=Xpine_sup,type="response"),
predict(modplsform,newdata=Xpine_sup,type="response"))

#Select the number of components to use to derive the prediction
predict(modpls,newdata=Xpine_sup,type="response",comps=1)    
predict(modpls,newdata=Xpine_sup,type="response",comps=3)    
predict(modpls,newdata=Xpine_sup,type="response",comps=6)    
try(predict(modpls,newdata=Xpine_sup,type="response",comps=8))

#Identical to modpls2$ttValsPredictY
predict(modpls,newdata=Xpine_sup,type="scores")    

#Select the number of components in the scores matrix
predict(modpls,newdata=Xpine_sup,type="scores",comps=1)    
predict(modpls,newdata=Xpine_sup,type="scores",comps=3)    
predict(modpls,newdata=Xpine_sup,type="scores",comps=6)    
try(predict(modpls,newdata=Xpine_sup,type="scores",comps=8))

#Identical to modpls2NA$ValsPredictY
predict(modpls,newdata=Xpine_supNA,type="response",methodNA="missingdata")    

cbind(predict(modpls,newdata=Xpine_supNA,type="response"),
predict(modplsform,newdata=Xpine_supNA,type="response"))

predict(modpls,newdata=Xpine_supNA,type="response",comps=1)    
predict(modpls,newdata=Xpine_supNA,type="response",comps=3)    
predict(modpls,newdata=Xpine_supNA,type="response",comps=6)    
try(predict(modpls,newdata=Xpine_supNA,type="response",comps=8))

#Identical to modpls2NA$ttPredictY
predict(modpls,newdata=Xpine_supNA,type="scores",methodNA="missingdata")
predict(modplsform,newdata=Xpine_supNA,type="scores",methodNA="missingdata")

predict(modpls,newdata=Xpine_supNA,type="scores")    
predict(modplsform,newdata=Xpine_supNA,type="scores")    
predict(modpls,newdata=Xpine_supNA,type="scores",comps=1)    
predict(modpls,newdata=Xpine_supNA,type="scores",comps=3)    
predict(modpls,newdata=Xpine_supNA,type="scores",comps=6)    
try(predict(modpls,newdata=Xpine_supNA,type="scores",comps=8))
## End(No test)    



