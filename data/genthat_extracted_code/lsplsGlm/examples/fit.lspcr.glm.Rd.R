library(lsplsGlm)


### Name: fit.lspcr.glm
### Title: Fitting a LS-PCR model for logistic regression
### Aliases: fit.lspcr.glm

### ** Examples
 
#Data
data(BreastCancer)
#Vector of response
Y<-BreastCancer$Y
#Genetic data
X<-BreastCancer$X
#Clinical data
D<-BreastCancer$D
#Apply fit.lspcr.glm with ncomp=5 using the 76 first patients
fit<-fit.lspcr.glm(Y=Y[1:76],X=X[1:76,],D=D[1:76,],ncomp=5)

#using projection to predict class of 2 last patients
newX<-X[77:78,]
newD<-D[77:78,]

#New Score matrix
newScores<-newX%*%fit$projection

#prediction
newEta=cbind(rep(1,dim(newD)[1]),newD,newScores)%*%fit$coefficients
newPi=1/(1+exp(-newEta))
newY=as.numeric(newEta>0)



