library(FRESA.CAD)


### Name: benchmarking
### Title: Compare performance of different model fitting/filtering
###   algorithms
### Aliases: BinaryBenchmark RegresionBenchmark OrdinalBenchmark
### Keywords: Benchmarking

### ** Examples

	## Not run: 
##D 
##D 		### Binary Classification Example ####
##D 		# Start the graphics device driver to save all plots in a pdf format
##D 		pdf(file = "BinaryClassificationExample.pdf",width = 8, height = 6)
##D 		# Get the stage C prostate cancer data from the rpart package
##D 
##D 		data(stagec,package = "rpart")
##D 
##D 		# Prepare the data. Create a model matrix without the event time
##D 		stagec$pgtime <- NULL
##D 		stagec$eet <- as.factor(stagec$eet)
##D 		options(na.action = 'na.pass')
##D 		stagec_mat <- cbind(pgstat = stagec$pgstat,
##D 		as.data.frame(model.matrix(pgstat ~ .,stagec))[-1])
##D 
##D 		# Impute the missing data
##D         dataCancerImputed <- nearestNeighborImpute(stagec_mat)
##D         dataCancerImputed[,1:ncol(dataCancerImputed)] <- sapply(dataCancerImputed,as.numeric)
##D 
##D 		# Cross validating a LDA classifier.
##D 		# 80##D 
##D 		cv <- randomCV(dataCancerImputed,"pgstat",MASS::lda,trainFraction = 0.8, 
##D 		repetitions = 10,featureSelectionFunction = univariate_tstudent,
##D 		featureSelection.control = list(limit = 0.5,thr = 0.975));
##D 
##D 		# Compare the LDA classifier with other methods
##D 		cp <- BinaryBenchmark(referenceCV = cv,referenceName = "LDA",
##D 		                      referenceFilterName="t.Student")
##D 		pl <- plot(cp,prefix = "StageC: ")
##D 
##D 		# Default Benchmark classifiers method (BSWiMS) and filter methods. 
##D 		# 80##D 
##D 		cp <- BinaryBenchmark(theData = dataCancerImputed,
##D 		theOutcome = "pgstat", reps = 10, fraction = 0.8)
##D 
##D 		# plot the Cross Validation Metrics
##D 		pl <- plot(cp,prefix = "Stagec:");
##D 
##D 		# Shut down the graphics device driver
##D 		dev.off()
##D 
##D 		#### Regression Example ######
##D 		# Start the graphics device driver to save all plots in a pdf format
##D 		pdf(file = "RegressionExample.pdf",width=8, height=6)
##D 
##D 		# Get the body fat data from the TH package
##D 
##D 		data("bodyfat", package = "TH.data")
##D 
##D 		# Benchmark regression methods and filter methods. 
##D 		#80##D 
##D 		cp <- RegresionBenchmark(theData = bodyfat, 
##D 		theOutcome = "DEXfat", reps = 10, fraction = 0.8)
##D 
##D 		# plot the Cross Validation Metrics
##D 		pl <- plot(cp,prefix = "Body Fat:");
##D 		# Shut down the graphics device driver
##D 		dev.off()
##D 
##D 		#### Ordinal Regression Example #####
##D 		# Start the graphics device driver to save all plots in a pdf format
##D 		pdf(file = "OrdinalRegressionExample.pdf",width=8, height=6)
##D 
##D 
##D 		# Get the GBSG2 data
##D 		data("GBSG2", package = "TH.data")
##D 
##D 		# Prepare the model frame for benchmarking
##D 		GBSG2$time <- NULL;
##D 		GBSG2$cens <- NULL;
##D 		GBSG2_mat <- cbind(tgrade = as.numeric(GBSG2$tgrade),
##D 		as.data.frame(model.matrix(tgrade~.,GBSG2))[-1])
##D 
##D 		# Benchmark regression methods and filter methods. 
##D 		#30##D 
##D 		cp <- OrdinalBenchmark(theData = GBSG2_mat, 
##D 		theOutcome = "tgrade", reps = 10, fraction = 0.3)
##D 
##D 		# plot the Cross Validation Metrics
##D 		pl <- plot(cp,prefix = "GBSG:");
##D 
##D 		# Shut down the graphics device driver
##D 		dev.off()
##D 
##D 	
## End(Not run)




