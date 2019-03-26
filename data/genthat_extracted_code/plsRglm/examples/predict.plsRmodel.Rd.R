library(plsRglm)


### Name: predict.plsRmodel
### Title: Print method for plsR models
### Aliases: predict.plsRmodel
### Keywords: methods predict

### ** Examples

data(pine)
Xpine<-pine[,1:10]
ypine<-pine[,11]
data(pine_sup)
Xpine_sup<-pine_sup[,1:10]
Xpine_supNA<-Xpine_sup
Xpine_supNA[1,1]<-NA

modpls=plsR(dataY=ypine,dataX=Xpine,nt=6,modele="pls")
modplsform=plsR(x11~.,data=pine,nt=6,modele="pls")
modpls2=plsR(dataY=ypine,dataX=Xpine,nt=6,modele="pls",dataPredictY=Xpine_sup)
modpls2NA=plsR(dataY=ypine,dataX=Xpine,nt=6,modele="pls",dataPredictY=Xpine_supNA)

#Identical to predict(modpls,type="response") or modpls$ValsPredictY
cbind(predict(modpls),predict(modplsform))

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



