library(FRESA.CAD)


### Name: randomCV
### Title: Cross Validation of Prediction Models
### Aliases: randomCV
### Keywords: Model_CV

### ** Examples

	## Not run: 
##D 
##D         ### Cross Validation Example ####
##D         # Start the graphics device driver to save all plots in a pdf format
##D         pdf(file = "CrossValidationExample.pdf",width = 8, height = 6)
##D 
##D         # Get the stage C prostate cancer data from the rpart package
##D         data(stagec,package = "rpart")
##D 
##D         # Prepare the data. Create a model matrix with interactions but no event time 
##D         stagec$pgtime <- NULL
##D         stagec$eet <- as.factor(stagec$eet)
##D         options(na.action = 'na.pass')
##D         stagec_mat <- cbind(pgstat = stagec$pgstat,
##D                          as.data.frame(model.matrix(pgstat ~ .*.,stagec))[-1])
##D         fnames <- colnames(stagec_mat)
##D         fnames <- str_replace_all(fnames,":","__")
##D         colnames(stagec_mat) <- fnames
##D 
##D         # Impute the missing data
##D         dataCancerImputed <- nearestNeighborImpute(stagec_mat)
##D         dataCancerImputed[,1:ncol(dataCancerImputed)] <- sapply(dataCancerImputed,as.numeric)
##D 
##D         # Cross validating a Random Forest classifier
##D         cvRF <- randomCV(dataCancerImputed,"pgstat",
##D                          randomForest::randomForest,
##D                          trainFraction = 0.8, 
##D                          repetitions = 10,
##D                          asFactor = TRUE);
##D 
##D         # Evaluate the prediction performance of the Random Forest classifier
##D         RFStats <- predictionStats_binary(cvRF$medianTest,
##D         plotname = "Random Forest",cex = 0.9);
##D 
##D         # Cross validating a BSWiMS with the same train/test set
##D         cvBSWiMS <- randomCV(fittingFunction = BSWiMS.model,
##D         	trainSampleSets = cvRF$trainSamplesSets);
##D 
##D         # Evaluate the prediction performance of the BSWiMS classifier
##D         BSWiMSStats <- predictionStats_binary(cvBSWiMS$medianTest,
##D         	plotname = "BSWiMS",cex = 0.9);
##D 
##D         # Cross validating a LDA classifier with a t-student filter
##D         cvLDA <- randomCV(dataCancerImputed,"pgstat",MASS::lda,
##D                           trainSampleSets = cvRF$trainSamplesSets,
##D                           featureSelectionFunction = univariate_tstudent,
##D                           featureSelection.control = list(limit = 0.5,thr = 0.975));
##D 
##D         # Evaluate the prediction performance of the LDA classifier
##D         LDAStats <- predictionStats_binary(cvLDA$medianTest,plotname = "LDA",cex = 0.9);
##D 
##D         # Cross validating a QDA classifier with LDA t-student features and RF train/test set
##D         cvQDA <- randomCV(fittingFunction = MASS::qda,
##D                           trainSampleSets = cvRF$trainSamplesSets,
##D                           featureSelectionFunction = cvLDA$selectedFeaturesSet);
##D 
##D         # Evaluate the prediction performance of the QDA classifier
##D         QDAStats <- predictionStats_binary(cvQDA$medianTest,plotname = "QDA",cex = 0.9);
##D 
##D         #Create a barplot with 95##D 
##D         errorciTable <- rbind(RFStats$berror,
##D         	BSWiMSStats$berror,
##D         	LDAStats$berror,
##D         	QDAStats$berror)
##D 
##D         bpCI <- barPlotCiError(as.matrix(errorciTable),metricname = "Balanced Error",
##D                         	   thesets =  c("Classifier Method"),
##D                         	   themethod = c("RF","BSWiMS","LDA","QDA"),
##D                         	   main = "Balanced Error",
##D                         	   offsets = c(0.5,0.15),
##D                         	   scoreDirection = "<",
##D                         	   ho = 0.5,
##D                         	   args.legend = list(bg = "white",x = "topright"),
##D                         	   col = terrain.colors(4));
##D 
##D 
##D 
##D         dev.off()
##D 	
## End(Not run)



