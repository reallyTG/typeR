library(semTools)


### Name: standardizeMx-deprecated
### Title: Find standardized estimates for OpenMx output
### Aliases: standardizeMx-deprecated
### Keywords: internal

### ** Examples


## Not run: 
##D library(OpenMx)
##D data(myFADataRaw)
##D myFADataRaw <- myFADataRaw[,c("x1","x2","x3","x4","x5","x6")]
##D oneFactorModel <- mxModel("Common Factor Model Path Specification",
##D 	type="RAM",
##D 	mxData(
##D 		observed=myFADataRaw,
##D 		type="raw"
##D 	),
##D 	manifestVars=c("x1","x2","x3","x4","x5","x6"),
##D 	latentVars="F1",
##D 	mxPath(from=c("x1","x2","x3","x4","x5","x6"),
##D 		arrows=2,
##D 		free=TRUE,
##D 		values=c(1,1,1,1,1,1),
##D 		labels=c("e1","e2","e3","e4","e5","e6")
##D 	),
##D 	# residual variances
##D 	# -------------------------------------
##D 	mxPath(from="F1",
##D 		arrows=2,
##D 		free=TRUE,
##D 		values=1,
##D 		labels ="varF1"
##D 	),
##D 	# latent variance
##D 	# -------------------------------------
##D 	mxPath(from="F1",
##D 		to=c("x1","x2","x3","x4","x5","x6"),
##D 		arrows=1,
##D 		free=c(FALSE,TRUE,TRUE,TRUE,TRUE,TRUE),
##D 		values=c(1,1,1,1,1,1),
##D 		labels =c("l1","l2","l3","l4","l5","l6")
##D 	),
##D 	# factor loadings
##D 	# -------------------------------------
##D 	mxPath(from="one",
##D 		to=c("x1","x2","x3","x4","x5","x6","F1"),
##D 		arrows=1,
##D 		free=c(TRUE,TRUE,TRUE,TRUE,TRUE,TRUE,FALSE),
##D 		values=c(1,1,1,1,1,1,0),
##D 		labels =c("meanx1","meanx2","meanx3","meanx4","meanx5","meanx6",NA)
##D 	)
##D 	# means
##D 	# -------------------------------------
##D ) # close model
##D # Create an MxModel object
##D # -----------------------------------------------------------------------------
##D oneFactorFit <- mxRun(oneFactorModel)
##D standardizeMx(oneFactorFit)
##D 
##D # Compare with lavaan
##D library(lavaan)
##D script <- "f1 =~ x1 + x2 + x3 + x4 + x5 + x6"
##D fit <- cfa(script, data=myFADataRaw, meanstructure=TRUE)
##D standardizedSolution(fit)
## End(Not run)




