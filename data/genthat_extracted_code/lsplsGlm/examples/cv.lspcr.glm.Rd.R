library(lsplsGlm)


### Name: cv.lspcr.glm
### Title: Cross-validation for LS-PCR model for logistic regression
### Aliases: cv.lspcr.glm

### ** Examples


#data
data(BreastCancer)
#vector of responses
Y<-BreastCancer$Y
#Genetic data
X<-BreastCancer$X
#Clinical data
D<-BreastCancer$D
#SIS selection
X<-scale(X)
## No test: 
X<-SIS.selection(X=X,Y=Y,pred=50)
#cross validation to find the optimal number of component
cv<-cv.lspcr.glm(Y=Y,X=X,D=D,folds=5,ncompmax=5,proportion=0.9)
ncompopt<-cv$ncompopt
## End(No test)



