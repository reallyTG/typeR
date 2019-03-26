library(bestglm)


### Name: LOOCV
### Title: Leave-one-out cross-validation
### Aliases: LOOCV
### Keywords: models regression

### ** Examples

#Example. Compare LOO CV with K-fold CV.
#Find CV MSE's for LOOCV and compare with K=5, 10, 20, 40, 50, 60
#Takes about 30 sec
## Not run: 
##D  data(zprostate)
##D  train<-(zprostate[zprostate[,10],])[,-10]
##D  X<-train[,1:2]
##D  y<-train[,9]
##D  CVLOO<-LOOCV(X,y)
##D  KS<-c(5,10,20,40,50,60)
##D  nKS<-length(KS)
##D  cvs<-numeric(nKS)
##D  set.seed(1233211231)
##D  for (iK in 1:nKS)
##D     cvs[iK]<-CVDH(X,y,K=KS[iK],REP=10)[1]
##D  boxplot(cvs)
##D  abline(h=CVLOO, lwd=3, col="red")
##D  title(sub="Boxplot of CV's with K=5,10,20,40,50,60 and LOO CV in red")
##D  
## End(Not run)



