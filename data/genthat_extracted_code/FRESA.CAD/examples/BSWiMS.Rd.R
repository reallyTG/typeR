library(FRESA.CAD)


### Name: BSWiMS.model
### Title: BSWiMS model selection
### Aliases: BSWiMS.model
### Keywords: Model_Generation

### ** Examples

	## Not run: 
##D 
##D 		# Start the graphics device driver to save all plots in a pdf format
##D 		pdf(file = "BSWiMS.model.Example.pdf",width = 8, height = 6)
##D 
##D 		# Get the stage C prostate cancer data from the rpart package
##D 		data(stagec,package = "rpart")
##D 		options(na.action = 'na.pass')
##D 		stagec_mat <- cbind(pgstat = stagec$pgstat,
##D              pgtime = stagec$pgtime,
##D              as.data.frame(model.matrix(Surv(pgtime,pgstat) ~ .*.,stagec))[-1])
##D 		fnames <- colnames(stagec_mat)
##D 		fnames <- str_replace_all(fnames,":","__")
##D 		colnames(stagec_mat) <- fnames
##D 
##D 		dataCancerImputed <- nearestNeighborImpute(stagec_mat)
##D 
##D 		# Get a Cox proportional hazards model using:
##D 		# - The default parameters
##D 		md <- BSWiMS.model(formula = Surv(pgtime, pgstat) ~ 1,
##D 						  data = dataCancerImputed)
##D 
##D 		#Plot the bootstrap validation
##D 		pt <- plot(md$BSWiMS.model$bootCV)
##D 
##D 		#Get the coefficients summary
##D 		sm <- summary(md)
##D 		print(sm$coefficients)
##D 
##D 		#Plot the bagged model 
##D 		pl <- plotModels.ROC(cbind(dataCancerImputed$pgstat,
##D 							  predict(md,dataCancerImputed)),
##D 							 main = "Bagging Predictions")
##D 
##D 
##D 		# Get a Cox proportional hazards model using:
##D 		# - The default parameters but repeated 10 times
##D 		md <- BSWiMS.model(formula = Surv(pgtime, pgstat) ~ 1,
##D 						   data = dataCancerImputed,
##D 						   NumberofRepeats = 10)
##D 
##D 		#Get the coefficients summary
##D 		sm <- summary(md)
##D 		print(sm$coefficients)
##D 
##D 		#Check all the formulas
##D 		print(md$formula.list)
##D 
##D 		#Plot the bagged model 
##D 		pl <- plotModels.ROC(cbind(dataCancerImputed$pgstat,
##D 								   predict(md,dataCancerImputed)),
##D 							 main = "Bagging Predictions")
##D 
##D 
##D 		# Get a  regression of the survival time
##D 
##D 		timeSubjects <- dataCancerImputed
##D 		timeSubjects$pgtime <- log(timeSubjects$pgtime)
##D 
##D 		md <- BSWiMS.model(formula = pgtime ~ 1,
##D 						  data = timeSubjects,
##D 						  )
##D 		pt <- plot(md$BSWiMS.model$bootCV)
##D 		sm <- summary(md)
##D 		print(sm$coefficients)
##D 
##D 		# Get a logistic regression model using
##D 		# - The default parameters and removing time as possible predictor
##D 		data(stagec,package = "rpart")
##D 		stagec$pgtime <- NULL
##D 		stagec_mat <- cbind(pgstat = stagec$pgstat,
##D                      as.data.frame(model.matrix(pgstat ~ .*.,stagec))[-1])
##D 		fnames <- colnames(stagec_mat)
##D 		fnames <- str_replace_all(fnames,":","__")
##D 		colnames(stagec_mat) <- fnames
##D 		dataCancerImputed <- nearestNeighborImpute(stagec_mat)
##D 
##D 
##D 		md <- BSWiMS.model(formula = pgstat ~ 1,
##D 						  data = dataCancerImputed)
##D 
##D 		pt <- plot(md$BSWiMS.model$bootCV)
##D 		sm <- summary(md)
##D 		print(sm$coefficients)
##D 
##D 
##D 		# Get a ordinal regression of grade model using GBSG2 data
##D 		# - The default parameters and removing the 
##D 		# time and status as possible predictor
##D 
##D 		data("GBSG2", package = "TH.data")
##D 
##D 		# Prepare the model frame for prediction
##D 		GBSG2$time <- NULL;
##D 		GBSG2$cens <- NULL;
##D 		GBSG2_mat <- cbind(tgrade = as.numeric(GBSG2$tgrade),
##D                        as.data.frame(model.matrix(tgrade~.*.,GBSG2))[-1])
##D 
##D 		fnames <- colnames(GBSG2_mat)
##D 		fnames <- str_replace_all(fnames,":","__")
##D 		colnames(GBSG2_mat) <- fnames
##D 
##D 		md <- BSWiMS.model(formula = tgrade ~ 1,
##D 						   data = GBSG2_mat)
##D 
##D 		sm <- summary(md$oridinalModels$theBaggedModels[[1]]$bagged.model)
##D 		print(sm$coefficients)
##D 		sm <- summary(md$oridinalModels$theBaggedModels[[2]]$bagged.model)
##D 		print(sm$coefficients)
##D 
##D 		print(table(GBSG2_mat$tgrade,predict(md,GBSG2_mat)))
##D 
##D 		# Shut down the graphics device driver
##D 		dev.off()
##D 
##D 	
## End(Not run)



