library(MSGLasso)


### Name: MSGLasso.cv
### Title: Fit the MSGLasso for a series sets of tuning parameters and use
###   the k-fold cross validation to select the optimal tunning parameter
###   set.
### Aliases: MSGLasso.cv
### Keywords: methods

### ** Examples


## Not run: 
##D #####################################################
##D # Simulate data
##D #####################################################
##D 
##D set.seed(sample(1:100,1))
##D G.arr <- c(0,20,20,20,20,20,20,20,20,20,20)
##D 
##D data("Beta.m")
##D 
##D ######## generate data set for model fitting
##D 
##D simDataGen<-function(N, Beta, rho, s, G.arr, seed=1){
##D 
##D P<-nrow(Beta)
##D Q<-ncol(Beta)
##D gsum<-0
##D X.m<-NULL
##D 
##D set.seed(seed)
##D 
##D Sig<-matrix(0,P,P)
##D jstart <-1
##D 
##D for(g in 1:length(G.arr)-1){
##D X.m<-cbind(X.m, matrix(rnorm(N*G.arr[g+1]),N,G.arr[g+1], byrow=TRUE))
##D 
##D for(i in 2:P){ for(j in jstart: (i-1)){
##D 
##D     Sig[i,j]<-rho^(abs(i-j))
##D 
##D     Sig[j,i]<-Sig[i,j]
##D 
##D }}
##D jstart <- jstart + G.arr[g+1]
##D }
##D 
##D 
##D diag(Sig)<-1
##D R<-chol(Sig)
##D 
##D X.m<-X.m%*%R
##D 
##D SVsum <-0
##D 
##D for (q in 1:Q){SVsum <-SVsum+var(X.m %*% Beta[,q])}
##D sdr =sqrt(s*SVsum/Q)
##D 
##D E.m <- matrix(rnorm(N*Q,0,sdr),N, Q, byrow=TRUE)
##D 
##D Y.m<-X.m%*%Beta+E.m
##D 
##D return(list(X=X.m, Y=Y.m, E=E.m))
##D }
##D 
##D N <-150
##D 
##D rho=0.5; 
##D s=4;
##D 
##D Data <- simDataGen(N, Beta.m,rho, s, G.arr, seed=sample(1:100,1))
##D X.m<-Data$X
##D Y.m<-Data$Y
##D 
##D ################################################
##D ## cross validation using the example data
##D ################################################
##D P <- dim(Beta.m)[1]
##D Q <- dim(Beta.m)[2]
##D G <- 10
##D R <- 10
##D 
##D gmax <- 1
##D cmax <- 20
##D GarrStarts <- c(0,20,40,60,80,100,120,140,160,180)
##D GarrEnds <- c(19,39,59,79,99,119,139,159,179,199)
##D RarrStarts <- c(0,20,40,60,80,100,120,140,160,180)
##D RarrEnds <- c(19,39,59,79,99,119,139,159,179,199)
##D 
##D tmp <- FindingPQGrps(P, Q, G, R, gmax, GarrStarts, GarrEnds, RarrStarts, RarrEnds)
##D PQgrps <- tmp$PQgrps
##D 
##D tmp1 <- Cal_grpWTs(P, Q, G, R, gmax, PQgrps)
##D grpWTs <- tmp1$grpWTs
##D 
##D tmp2 <- FindingGRGrps(P, Q, G, R, cmax, GarrStarts, GarrEnds, RarrStarts, RarrEnds)
##D GRgrps <- tmp2$GRgrps
##D 
##D Pen_L <- matrix(rep(1,P*Q),P,Q, byrow=TRUE)
##D Pen_G <- matrix(rep(1,G*R),G,R, byrow=TRUE)
##D grp_Norm0 <- matrix(rep(0, G*R), nrow=G, byrow=TRUE)
##D 
##D lam1.v <- seq(1.0, 1.5, length=6) 
##D lamG.v <- seq(0.19, 0.25, length=7) 
##D 
##D try.cv<- MSGLasso.cv(X.m, Y.m, grpWTs, Pen_L, Pen_G, PQgrps, GRgrps, 
##D    lam1.v, lamG.v, fold=5, seed=1)
##D MSGLassolam1 <- try.cv$lams.c[which.min(as.vector(try.cv$rss.cv))][[1]]$lam1
##D MSGLassolamG  <- try.cv$lams.c[which.min(as.vector(try.cv$rss.cv))][[1]]$lam3
##D MSGLassolamG.m <- matrix(rep(MSGLassolamG, G*R),G,R,byrow=TRUE)
##D  
##D system.time(try <-MSGLasso(X.m, Y.m, grpWTs, Pen_L, Pen_G, PQgrps, GRgrps, 
##D     grp_Norm0, MSGLassolam1, MSGLassolamG.m, Beta0=NULL))
##D 
## End(Not run)



