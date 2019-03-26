library(lsplsGlm)


### Name: predict.lspls.glm
### Title: Predict method for LS-PLS model fits.
### Aliases: predict.lspls.glm

### ** Examples


#Data
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

#split data, 2/3 of our datasets are used to compose learning samples
index<-preselected.sample(Y,trunc(2*length(Y)/3)) 
XL<-X[index,]
DL<-D[index,]
YL<-Y[index]

#1/3 is four our test samples
XT<-X[-index,]
DT<-D[-index,]
YT<-Y[-index]

#cross validation to find the optimal number of component
#method LS-PLS-IRLS
ncompopt.lsplsirls<-cv.lspls.glm(Y=YL,X=XL,D=DL,folds=5,ncompmax=5,
                      proportion=0.7,method="LS-PLS-IRLS")$ncompopt
#method R-LS-PLS
cv<-cv.lspls.glm(Y=YL,X=XL,D=DL,ncompmax=5,proportion=0.7,method="R-LS-PLS",
                      lambda.grid=exp(log(10^seq(-3,2,0.7))),penalized=TRUE,
		      nbrIterMax=15,threshold=10^(-12))
ncompopt.rlspls<-cv$ncompopt
lambdaopt.rlspls<-cv$lambdaopt
#method IR-LS-PLS
ncompopt.irlspls<-cv.lspls.glm(Y=YL,X=XL,D=DL,ncompmax=5,proportion=0.7,method="IR-LS-PLS",
                                                 nbrIterMax=15,threshold=10^(-12))$ncompopt  

#fits
fit.lsplsirls<-fit.lspls.glm(Y=YL,X=XL,D=DL,ncomp=ncompopt.lsplsirls,
                                                method="LS-PLS-IRLS")
fit.rlspls<-fit.lspls.glm(Y=YL,X=XL,D=DL,ncomp=ncompopt.rlspls,method="R-LS-PLS",
                                          lambda=lambdaopt.rlspls,penalized=TRUE,
                                          nbrIterMax=15,threshold=10^(-12))
fit.irlspls<-fit.lspls.glm(Y=YL,X=XL,D=DL,ncomp=ncompopt.irlspls,method="IR-LS-PLS",
                                                   nbrIterMax=15,threshold=10^(-12))

#predictions
pred.lsplsrils<-predict.lspls.glm(fit.lsplsirls,newX = XT,newD = DT)
pred.rlspls<-predict.lspls.glm(fit.rlspls,newX = XT,newD = DT)
pred.irlspls<-predict.lspls.glm(fit.irlspls,newX = XT,newD = DT)

#Confusion mmatrix
table(YT,pred.lsplsrils$newY)
table(YT,pred.rlspls$newY) 
table(YT,pred.irlspls$newY) 
## End(No test)



