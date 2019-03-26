library(STPGA)


### Name: CRITERIA
### Title: Optimality Criteria
### Aliases: AOPT CDMAX CDMAX0 CDMAX2 CDMEAN CDMEAN0 CDMEAN2 CDMEANMM DOPT
###   EOPT GAUSSMEANMM GOPTPEV GOPTPEV2 PEVMAX PEVMAX0 PEVMAX2 PEVMEAN
###   PEVMEAN0 PEVMEAN2 PEVMEANMM dist_to_test dist_to_test2
###   neg_dist_in_train neg_dist_in_train2

### ** Examples

	## Not run: 
##D #Examples to new criterion:
##D #1- PEVmax
##D STPGAUSERFUNC<-function(Train,Test, P, lambda=1e-6, C=NULL){
##D   PTrain<-P[rownames(P)%in%Train,]
##D   PTest<-P[rownames(P)%in%Test,]
##D   if (length(Test)==1){PTest=matrix(PTest, nrow=1)}
##D   if (!is.null(C)){ PTest<-C%*%PTest}
##D   PEV<-PTest%*%solve(crossprod(PTrain)+lambda*diag(ncol(PTrain)),t(PTrain))
##D     PEVmax<-max(diag(tcrossprod(PEV)))
##D   return(PEVmax)
##D }
##D 
##D 
##D 
##D 
##D ######Here is an example of usage
##D data(iris)
##D #We will try to estimate petal width from
##D #variables sepal length and width and petal length.
##D X<-as.matrix(iris[,1:4])
##D distX<-as.matrix(dist(X))
##D rownames(distX)<-colnames(distX)<-rownames(X)<-paste(iris[,5],rep(1:50,3),sep="_" )
##D #test data 25 iris plants selected at random from the virginica family,
##D #candidates are the plants in the  setosa and versicolor families.
##D candidates<-rownames(X)[1:100]
##D test<-sample(setdiff(rownames(X),candidates), 25)
##D #want to select 25 examples using the criterion defined in STPGAUSERFUNC
##D #Increase niterations and npop substantially for better convergence.
##D ListTrain<-GenAlgForSubsetSelection(P=distX,Candidates=candidates,
##D Test=test,ntoselect=25,npop=50,
##D nelite=5, mutprob=.8, niterations=30,
##D lambda=1e-5, errorstat="STPGAUSERFUNC", plotiters=TRUE)
## End(Not run)



