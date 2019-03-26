library(lsplsGlm)


### Name: cv.lspls.glm
### Title: Cross-validation for LS-PLS model for logistic regression
### Aliases: cv.lspls.glm

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
#Cross validation, 90% of our datasets is used to compose learning samples

#method LS-PLS-IRLS
ncompopt.lsplsirls<-cv.lspls.glm(Y=Y,X=X,D=D,folds=5,ncompmax=5,proportion=0.9,
		method="LS-PLS-IRLS")$ncompopt
#method R-LS-PLS
cv<-cv.lspls.glm(Y=Y,X=X,D=D,ncompmax=5,proportion=0.9,method="R-LS-PLS",
	                          lambda.grid=exp(log(10^seq(-3,2,0.7))), 
                                  penalized=TRUE,nbrIterMax=15,
	                          threshold=10^(-12))
ncompopt.rlspls<-cv$ncompopt
lambdaopt.rlspls<-cv$lambdaopt
#method IR-LS-PLS
ncompopt.irlspls<-cv.lspls.glm(Y=Y,X=X,D=D,ncompmax=5,proportion=0.9,method="IR-LS-PLS",
                               nbrIterMax=15,threshold=10^(-12))$ncompopt    

## End(No test)



