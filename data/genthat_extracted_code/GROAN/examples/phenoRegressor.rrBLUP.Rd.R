library(GROAN)


### Name: phenoRegressor.rrBLUP
### Title: SNP-BLUP or G-BLUP using rrBLUP package
### Aliases: phenoRegressor.rrBLUP

### ** Examples

## Not run: 
##D #using the GROAN.KI dataset, we regress on the dataset and predict the first ten phenotypes
##D phenos = GROAN.KI$yield
##D phenos[1:10]  = NA
##D 
##D #calling the regressor with ridge regression BLUP on SNPs and kinship
##D results.SNP.BLUP = phenoRegressor.rrBLUP(
##D   phenotypes = phenos,
##D   genotypes = GROAN.KI$SNPs,
##D   SE = TRUE, return.Hinv = TRUE #rrBLUP-specific parameters
##D )
##D results.G.BLUP = phenoRegressor.rrBLUP(
##D   phenotypes = phenos,
##D   covariances = GROAN.KI$kinship,
##D   SE = TRUE, return.Hinv = TRUE #rrBLUP-specific parameters
##D )
##D 
##D #examining the predictions
##D plot(GROAN.KI$yield, results.SNP.BLUP$predictions,
##D      main = '[SNP-BLUP] Train set (black) and test set (red) regressions',
##D      xlab = 'Original phenotypes', ylab = 'Predicted phenotypes')
##D abline(a=0, b=1)
##D points(GROAN.KI$yield[1:10], results.SNP.BLUP$predictions[1:10], pch=16, col='red')
##D 
##D plot(GROAN.KI$yield, results.G.BLUP$predictions,
##D      main = '[G-BLUP] Train set (black) and test set (red) regressions',
##D      xlab = 'Original phenotypes', ylab = 'Predicted phenotypes')
##D abline(a=0, b=1)
##D points(GROAN.KI$yield[1:10], results.G.BLUP$predictions[1:10], pch=16, col='red')
##D 
##D #printing correlations
##D correlations = data.frame(
##D   model = 'SNP-BLUP',
##D   test_set_correlations = cor(GROAN.KI$yield[1:10], results.SNP.BLUP$predictions[1:10]),
##D   train_set_correlations = cor(GROAN.KI$yield[-(1:10)], results.SNP.BLUP$predictions[-(1:10)])
##D )
##D correlations = rbind(correlations, data.frame(
##D   model = 'G-BLUP',
##D   test_set_correlations = cor(GROAN.KI$yield[1:10], results.G.BLUP$predictions[1:10]),
##D   train_set_correlations = cor(GROAN.KI$yield[-(1:10)], results.G.BLUP$predictions[-(1:10)])
##D ))
##D print(correlations)
## End(Not run)



