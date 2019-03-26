library(FRESA.CAD)


### Name: FRESA.Model
### Title: Automated model selection
### Aliases: FRESA.Model
### Keywords: Model_Generation

### ** Examples

	## Not run: 
##D 
##D 		# Start the graphics device driver to save all plots in a pdf format
##D 		pdf(file = "FRESA.Model.Example.pdf",width = 8, height = 6)
##D 		# Get the stage C prostate cancer data from the rpart package
##D 		data(stagec,package = "rpart")
##D 		options(na.action = 'na.pass')
##D 		stagec_mat <- cbind(pgstat = stagec$pgstat,
##D 		    pgtime = stagec$pgtime,
##D 		    as.data.frame(model.matrix(Surv(pgtime,pgstat) ~ .,stagec))[-1])
##D 
##D 		data(cancerVarNames)
##D 		dataCancerImputed <- nearestNeighborImpute(stagec_mat)
##D 
##D 		# Get a Cox proportional hazards model using:
##D 		# - The default parameters
##D 		md <- FRESA.Model(formula = Surv(pgtime, pgstat) ~ 1,
##D 						  data = dataCancerImputed,
##D 						  var.description = cancerVarNames[,2])
##D 		pt <- plot(md$bootstrappedModel)
##D 		sm <- summary(md$BSWiMS.model)
##D 		print(sm$coefficients)
##D 
##D 
##D 		# Get a 10 fold CV Cox proportional hazards model using:
##D 		# - Repeat 10 times de CV
##D 		md <- FRESA.Model(formula = Surv(pgtime, pgstat) ~ 1,
##D 						  data = dataCancerImputed, CVfolds = 10, 
##D 						  repeats = 10,
##D 						  var.description = cancerVarNames[,2])
##D 		pt <- plotModels.ROC(md$cvObject$Models.testPrediction,theCVfolds = 10)
##D 		print(pt$predictionTable)
##D 
##D 		pt <- plotModels.ROC(md$cvObject$LASSO.testPredictions,theCVfolds = 10)
##D 		pt <- plotModels.ROC(md$cvObject$KNN.testPrediction,theCVfolds = 10)
##D 
##D 		# Get a  regression of the survival time
##D 
##D 		timeSubjects <- dataCancerImputed
##D 		timeSubjects$pgtime <- log(timeSubjects$pgtime)
##D 
##D 		md <- FRESA.Model(formula = pgtime ~ 1,
##D 						  data = timeSubjects,
##D 						  var.description = cancerVarNames[,2])
##D 		pt <- plot(md$bootstrappedModel)
##D 		sm <- summary(md$BSWiMS.model)
##D 		print(sm$coefficients)
##D 
##D 		# Get a logistic regression model using
##D 		# - The default parameters and removing time as possible predictor
##D 
##D 		dataCancerImputed$pgtime <- NULL
##D 
##D 		md <- FRESA.Model(formula = pgstat ~ 1,
##D 						  data = dataCancerImputed,
##D 						  var.description = cancerVarNames[,2])
##D 		pt <- plot(md$bootstrappedModel)
##D 		sm <- summary(md$BSWiMS.model)
##D 		print(sm$coefficients)
##D 
##D 		# Get a logistic regression model using:
##D 		# - residual-based optimization
##D 		md <- FRESA.Model(formula = pgstat ~ 1,
##D 						  data = dataCancerImputed,
##D 						  OptType = "Residual",
##D 						  var.description = cancerVarNames[,2])
##D 		pt <- plot(md$bootstrappedModel)
##D 		sm <- summary(md$BSWiMS.model)
##D 		print(sm$coefficients)
##D 
##D 
##D 		# Shut down the graphics device driver
##D 		dev.off()
##D 
##D 	
## End(Not run)



