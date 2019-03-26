library(metaSEM)


### Name: issp89
### Title: A Dataset from Cheung and Chan (2005; 2009)
### Aliases: issp89
### Keywords: datasets

### ** Examples

## Not run: 
##D data(issp89)
##D 
##D #### Analysis of correlation structure in Cheung and Chan (2005)
##D #### Fixed-effects model: Stage 1 analysis
##D cor1 <- tssem1(issp89$data, issp89$n, method="FEM", cor.analysis=TRUE)
##D summary(cor1)
##D   
##D ## Prepare a model implied matrix
##D ## Factor correlation matrix
##D Phi <- create.mxMatrix( c("0.3*corf2f1","0.3*corf3f1","0.3*corf3f2"),
##D                         type="Stand", as.mxMatrix=FALSE )
##D ## Error variances
##D Psi <- create.mxMatrix( paste("0.2*e", 1:9, sep=""), type="Diag",
##D                         as.mxMatrix=FALSE )
##D 
##D ## Create Smatrix
##D S1 <- bdiagMat(list(Psi, Phi))
##D ## dimnames(S1)[[1]] <- dimnames(S1)[[2]] <- c(paste("x",1:9,sep=""),
##D ##                                             paste("f",1:3,sep=""))
##D ## S1
##D S1 <- as.mxMatrix(S1)
##D 
##D ## Factor loadings
##D Lambda <- create.mxMatrix( c(".3*f1x1",".3*f1x2",".3*f1x3",rep(0,9),
##D                              ".3*f2x4",".3*f2x5",".3*f2x6",".3*f2x7",
##D                              rep(0,9),".3*f3x8",".3*f3x9"), type="Full",
##D                              ncol=3, nrow=9, as.mxMatrix=FALSE )
##D Zero1 <- matrix(0, nrow=9, ncol=9)
##D Zero2 <- matrix(0, nrow=3, ncol=12)
##D 
##D ## Create Amatrix
##D A1 <- rbind( cbind(Zero1, Lambda),
##D              Zero2 )
##D ## dimnames(A1)[[1]] <- dimnames(A1)[[2]] <- c(paste("x",1:9,sep=""),
##D ##                                             paste("f",1:3,sep=""))
##D ## A1
##D A1 <- as.mxMatrix(A1)
##D 
##D ## Create Fmatrix
##D F1 <- create.Fmatrix(c(rep(1,9), rep(0,3)))
##D   
##D #### Fixed-effects model: Stage 2 analysis
##D cor2 <- tssem2(cor1, Amatrix=A1, Smatrix=S1, Fmatrix=F1, intervals.type="LB")
##D summary(cor2)
##D 
##D ## Display the model with the parameter estimates
##D plot(cor2, nDigits=1)
##D 
##D #### Analysis of covariance structure in Cheung and Chan (2009)
##D #### Fixed-effects model: Stage 1 analysis
##D cov1 <- tssem1(issp89$data, issp89$n, method="FEM", cor.analysis=FALSE)
##D summary(cov1)
##D   
##D #### Fixed-effects model: Stage 2 analysis
##D cov2 <- tssem2(cov1, Amatrix=A1, Smatrix=S1, Fmatrix=F1)              
##D summary(cov2)
##D 
##D ## Display the model with the parameter estimates
##D plot(cov2, nDigits=1)
## End(Not run)



