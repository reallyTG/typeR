library(GROAN)


### Name: phenoRegressor.SVR
### Title: Support Vector Regression using package e1071
### Aliases: phenoRegressor.SVR

### ** Examples

## Not run: 
##D ### WARNING ###
##D #The 'tuning' part of the example can take quite some time to run,
##D #depending on the computational power.
##D 
##D #using the GROAN.KI dataset, we regress on the dataset and predict the first ten phenotypes
##D phenos = GROAN.KI$yield
##D phenos[1:10] = NA
##D 
##D #--------- TUNE ---------
##D #tuning the SVR on a grid of hyperparameters
##D results.tune = phenoRegressor.SVR(
##D   phenotypes = phenos,
##D   genotypes = GROAN.KI$SNPs,
##D   covariances = NULL,
##D   extraCovariates = NULL,
##D   mode = 'tune',
##D   kernel = 'linear', cost = 10^(-3:+3) #SVR-specific parameters
##D )
##D 
##D #examining the predictions
##D plot(GROAN.KI$yield, results.tune$predictions,
##D      main = 'Mode = TUNING\nTrain set (black) and test set (red) regressions',
##D      xlab = 'Original phenotypes', ylab = 'Predicted phenotypes')
##D points(GROAN.KI$yield[1:10], results.tune$predictions[1:10], pch=16, col='red')
##D 
##D #printing correlations
##D test.set.correlation  = cor(GROAN.KI$yield[1:10], results.tune$predictions[1:10])
##D train.set.correlation = cor(GROAN.KI$yield[-(1:10)], results.tune$predictions[-(1:10)])
##D writeLines(paste(
##D   'test-set correlation :', test.set.correlation,
##D   '\ntrain-set correlation:', train.set.correlation
##D ))
##D 
##D #--------- TRAIN ---------
##D #training the SVR, hyperparameters are given
##D results.train = phenoRegressor.SVR(
##D   phenotypes = phenos,
##D   genotypes = GROAN.KI$SNPs,
##D   covariances = NULL,
##D   extraCovariates = NULL,
##D   mode = 'train',
##D   kernel = 'linear', cost = 0.01 #SVR-specific parameters
##D )
##D 
##D #examining the predictions
##D plot(GROAN.KI$yield, results.train$predictions,
##D      main = 'Mode = TRAIN\nTrain set (black) and test set (red) regressions',
##D      xlab = 'Original phenotypes', ylab = 'Predicted phenotypes')
##D points(GROAN.KI$yield[1:10], results.train$predictions[1:10], pch=16, col='red')
##D 
##D #printing correlations
##D test.set.correlation  = cor(GROAN.KI$yield[1:10], results.train$predictions[1:10])
##D train.set.correlation = cor(GROAN.KI$yield[-(1:10)], results.train$predictions[-(1:10)])
##D writeLines(paste(
##D   'test-set correlation :', test.set.correlation,
##D   '\ntrain-set correlation:', train.set.correlation
##D ))
##D 
##D #--------- RUN ---------
##D #we recover the trained model from previous run, predictions will be exactly the same
##D results.run = phenoRegressor.SVR(
##D   phenotypes = phenos,
##D   genotypes = GROAN.KI$SNPs,
##D   covariances = NULL,
##D   extraCovariates = NULL,
##D   mode = 'run',
##D   tuned.model = results.train$extradata
##D )
##D 
##D #examining the predictions
##D plot(GROAN.KI$yield, results.run$predictions,
##D      main = 'Mode = RUN\nTrain set (black) and test set (red) regressions',
##D      xlab = 'Original phenotypes', ylab = 'Predicted phenotypes')
##D points(GROAN.KI$yield[1:10], results.run$predictions[1:10], pch=16, col='red')
##D 
##D #printing correlations
##D test.set.correlation  = cor(GROAN.KI$yield[1:10], results.run$predictions[1:10])
##D train.set.correlation = cor(GROAN.KI$yield[-(1:10)], results.run$predictions[-(1:10)])
##D writeLines(paste(
##D   'test-set correlation :', test.set.correlation,
##D   '\ntrain-set correlation:', train.set.correlation
##D ))
## End(Not run)



