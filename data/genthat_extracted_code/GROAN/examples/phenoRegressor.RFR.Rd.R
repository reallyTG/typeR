library(GROAN)


### Name: phenoRegressor.RFR
### Title: Random Forest Regression using package randomForest
### Aliases: phenoRegressor.RFR

### ** Examples

## Not run: 
##D #using the GROAN.KI dataset, we regress on the dataset and predict the first ten phenotypes
##D phenos = GROAN.KI$yield
##D phenos[1:10]  = NA
##D 
##D #calling the regressor with random forest
##D results = phenoRegressor.RFR(
##D   phenotypes = phenos,
##D   genotypes = GROAN.KI$SNPs,
##D   covariances = NULL,
##D   extraCovariates = NULL,
##D   ntree = 20,
##D   mtry = 200 #randomForest-specific parameters
##D )
##D 
##D #examining the predictions
##D plot(GROAN.KI$yield, results$predictions,
##D      main = 'Train set (black) and test set (red) regressions',
##D      xlab = 'Original phenotypes', ylab = 'Predicted phenotypes')
##D points(GROAN.KI$yield[1:10], results$predictions[1:10], pch=16, col='red')
##D 
##D #printing correlations
##D test.set.correlation  = cor(GROAN.KI$yield[1:10], results$predictions[1:10])
##D train.set.correlation = cor(GROAN.KI$yield[-(1:10)], results$predictions[-(1:10)])
##D writeLines(paste(
##D   'test-set correlation :', test.set.correlation,
##D   '\ntrain-set correlation:', train.set.correlation
##D ))
## End(Not run)



