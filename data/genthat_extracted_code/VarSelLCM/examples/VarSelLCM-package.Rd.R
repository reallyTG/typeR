library(VarSelLCM)


### Name: VarSelLCM-package
### Title: Variable Selection for Model-Based Clustering of Mixed-Type Data
###   Set with Missing Values
### Aliases: VarSelLCM-package VarSelLCM
### Keywords: package

### ** Examples

## Not run: 
##D # Package loading
##D require(VarSelLCM)
##D 
##D # Data loading:
##D # x contains the observed variables
##D # z the known statu (i.e. 1: absence and 2: presence of heart disease)
##D data(heart)
##D ztrue <- heart[,"Class"]
##D x <- heart[,-13]
##D 
##D # Cluster analysis without variable selection
##D res_without <- VarSelCluster(x, 2, vbleSelec = FALSE, crit.varsel = "BIC")
##D 
##D # Cluster analysis with variable selection (with parallelisation)
##D res_with <- VarSelCluster(x, 2, nbcores = 2, initModel=40, crit.varsel = "BIC")
##D 
##D # Comparison of the BIC for both models:
##D # variable selection permits to improve the BIC
##D BIC(res_without)
##D BIC(res_with)
##D 
##D # Comparison of the partition accuracy. 
##D # ARI is computed between the true partition (ztrue) and its estimators
##D # ARI is an index between 0 (partitions are independent) and 1 (partitions are equals)
##D # variable selection permits to improve the ARI
##D # Note that ARI cannot be used for model selection in clustering, because there is no true partition
##D ARI(ztrue, fitted(res_without))
##D ARI(ztrue, fitted(res_with))
##D 
##D # Estimated partition
##D fitted(res_with)
##D 
##D # Estimated probabilities of classification
##D head(fitted(res_with, type="probability"))
##D 
##D # Summary of the probabilities of missclassification
##D plot(res_with, type="probs-class")
##D 
##D # Confusion matrices and ARI (only possible because the "true" partition is known).
##D # ARI is computed between the true partition (ztrue) and its estimators
##D # ARI is an index between 0 (partitions are independent) and 1 (partitions are equals)
##D # variable selection permits to improve the ARI
##D # Note that ARI cannot be used for model selection in clustering, because there is no true partition
##D # variable selection decreases the misclassification error rate
##D table(ztrue, fitted(res_without))
##D table(ztrue, fitted(res_with))
##D ARI(ztrue,  fitted(res_without))
##D ARI(ztrue, fitted(res_with))
##D 
##D # Summary of the best model
##D summary(res_with)
##D 
##D # Discriminative power of the variables (here, the most discriminative variable is MaxHeartRate)
##D plot(res_with)
##D 
##D # More detailed output
##D print(res_with)
##D 
##D # Print model parameter
##D coef(res_with)
##D 
##D # Boxplot for the continuous variable MaxHeartRate
##D plot(x=res_with, y="MaxHeartRate")
##D 
##D # Empirical and theoretical distributions of the most discriminative variable
##D # (to check that the distribution is well-fitted)
##D plot(res_with, y="MaxHeartRate", type="cdf")
##D 
##D # Summary of categorical variable
##D plot(res_with, y="Sex")
##D 
##D # Probabilities of classification for new observations 
##D predict(res_with, newdata = x[1:3,])
##D 
##D # Imputation by posterior mean for the first observation
##D not.imputed <- x[1,]
##D imputed <- VarSelImputation(res_with, x[1,], method = "sampling")
##D rbind(not.imputed, imputed)
##D 
##D # Opening Shiny application to easily see the results
##D VarSelShiny(res_with)
##D 
##D 
## End(Not run)




