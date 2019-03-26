library(metaSEM)


### Name: issp05
### Title: A Dataset from ISSP (2005)
### Aliases: issp05
### Keywords: datasets

### ** Examples


## Not run: 
##D data(issp05)
##D 
##D #### Fixed-effects TSSEM
##D fixed1 <- tssem1(issp05$data, issp05$n, method="FEM")
##D summary(fixed1)
##D 
##D ## Prepare a model implied matrix
##D ## Factor correlation matrix
##D Phi <- create.mxMatrix( c("0.3*corf2f1","0.3*corf3f1","0.3*corf3f2"),
##D                         type="Stand", as.mxMatrix=FALSE )
##D 
##D ## Error variances
##D Psi <- create.mxMatrix( paste("0.2*e", 1:7, sep=""), type="Diag",
##D                         as.mxMatrix=FALSE )
##D 
##D ## Create Smatrix
##D S1 <- bdiagMat(list(Psi, Phi))
##D ## dimnames(S1)[[1]] <- dimnames(S1)[[2]] <- c(paste("x",1:7,sep=""),
##D ##                                             paste("f",1:3,sep=""))
##D ## S1
##D S1 <- as.mxMatrix(S1)
##D 
##D ## Factor loadings
##D Lambda <- create.mxMatrix( c(".3*f1x1",".3*f1x2",".3*f1x3",rep(0,7),
##D                              ".3*f2x4",".3*f2x5",rep(0,7),".3*f3x6",".3*f3x7"),
##D                            type="Full", ncol=3, nrow=7, as.mxMatrix=FALSE )
##D Zero1 <- matrix(0, nrow=7, ncol=7)
##D Zero2 <- matrix(0, nrow=3, ncol=10)
##D 
##D ## Create Amatrix
##D A1 <- rbind( cbind(Zero1, Lambda),
##D              Zero2 )
##D ## dimnames(A1)[[1]] <- dimnames(A1)[[2]] <- c(paste("x",1:7,sep=""),
##D ##                                             paste("f",1:3,sep=""))
##D ## A1
##D A1 <- as.mxMatrix(A1)
##D 
##D ## Create Fmatrix
##D F1 <- create.Fmatrix(c(rep(1,7), rep(0,3)))
##D 
##D #### Fixed-effects model: Stage 2 analysis
##D fixed2 <- tssem2(fixed1, Amatrix=A1, Smatrix=S1, Fmatrix=F1,
##D                  intervals.type="LB")
##D summary(fixed2)
##D 
##D plot(fixed2, nDigits=1)
## End(Not run)



