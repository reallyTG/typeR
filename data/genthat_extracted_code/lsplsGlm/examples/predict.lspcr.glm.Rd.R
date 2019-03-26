library(lsplsGlm)


### Name: predict.lspcr.glm
### Title: Predict method for LS-PCR fits.
### Aliases: predict.lspcr.glm

### ** Examples

#Data
data(BreastCancer)
#Vector of response
Y<-BreastCancer$Y
#Genetic data
X<-BreastCancer$X
#Clinical data
D<-BreastCancer$D

#Learn dataset and test dataset (80/20)
index<-preselected.sample(Y,round(length(Y)*0.8))
XL<-X[index,]
XT<-X[-index,]
DL<-D[index,]
DT<-D[-index,]
YL<-Y[index]
#Apply fit.lspcr.glm with 5 components
fit<-fit.lspcr.glm(Y=YL,X=XL,D=DL,ncomp=5)
#predictions
pred<-predict.lspcr.glm(fit,newD=DT,newX=XT)



