library(metaSEM)


### Name: Cheung09
### Title: A Dataset from TSSEM User's Guide Version 1.11 by Cheung (2009)
### Aliases: Cheung09
### Keywords: datasets

### ** Examples

## Not run: 
##D data(Cheung09)
##D 
##D #### Fixed-effects model: Stage 1 analysis
##D fixed1 <- tssem1(Cheung09$data, Cheung09$n, method="FEM")
##D summary(fixed1)
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
##D fixed2 <- tssem2(fixed1, Amatrix=A1, Smatrix=S1, Fmatrix=F1,
##D                  intervals.type="LB")
##D summary(fixed2)
##D 
##D ## Display the model
##D plot(fixed2, what="path")
##D 
##D ## Display the model with the parameter estimates
##D plot(fixed2, latNames=c("f1", "f2", "f3"), edge.label.cex=0.8,
##D      color="yellow")
## End(Not run)



