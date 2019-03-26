library(GLSME)


### Name: GLSME.predict
### Title: Prediction for a new observation using parameters estimated by
###   the 'GLSME' function
### Aliases: GLSME.predict
### Keywords: prediction generalized least squares regression measurement
###   error

### ** Examples

## Not run: 
##D library(mvSLOUCH)
##D library(ape)
##D library(ouch)
##D n<-5 ## number of species
##D apetree<-rtree(n)
##D phyltree<-ape2ouch(apetree) ##mvslouch requires ouch format
##D ### Correct the names of the internal node labels.
##D phyltree@nodelabels[1:(phyltree@nnodes-phyltree@nterm)]<-
##D as.character(1:(phyltree@nnodes-phyltree@nterm))
##D ### Define Brownian motion parameters to be able to simulate data under the Brownian motion model.
##D BMparameters<-list(vX0=matrix(0,nrow=2,ncol=1),Sxx=rbind(c(1,0),c(0.2,1)))
##D ### Now simulate the data and remove the values corresponding to the internal nodes.
##D xydata<-simulBMProcPhylTree(phyltree,X0=BMparameters$vX0,Sigma=BMparameters$Sxx)
##D xydata<-xydata[(nrow(xydata)-n+1):nrow(xydata),]
##D 
##D x<-xydata[,1]
##D y<-xydata[,2]
##D 
##D yerror<-diag((rnorm(n,mean=0,sd=0.1))^2) #create error matrix
##D y<-rmvnorm(1,mean=y,sigma=yerror)[1,]
##D xerror<-diag((rnorm(n,mean=0,sd=0.1))^2) #create error matrix
##D x<-rmvnorm(1,mean=x,sigma=xerror)[1,]
##D glsme.res<-GLSME(y=y, CenterPredictor=TRUE, D=cbind(rep(1, n), x), Vt=vcv(apetree), 
##D Ve=yerror, Vd=list("F",vcv(apetree)), Vu=list("F", xerror),OutputType="long")
##D GLSME.predict(c(1,1), glsme.res, vy=1, vx=rbind(c(0,0),c(0,1)))
## End(Not run)


