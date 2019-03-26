library(VarSelLCM)


### Name: plot
### Title: Plots of an instance of 'VSLCMresults'
### Aliases: plot plot,VSLCMresults-method
###   plot,VSLCMresults,character-method plot,VSLCMresults,ANY-method

### ** Examples

## Not run: 
##D require(VarSelLCM)
##D 
##D # Data loading:
##D # x contains the observed variables
##D # z the known statu (i.e. 1: absence and 2: presence of heart disease)
##D data(heart)
##D ztrue <- heart[,"Class"]
##D x <- heart[,-13]
##D 
##D # Cluster analysis with variable selection (with parallelisation)
##D res_with <- VarSelCluster(x, 2, nbcores = 2, initModel=40)
##D 
##D # Summary of the probabilities of missclassification
##D plot(res_with, type="probs-class")
##D 
##D # Discriminative power of the variables (here, the most discriminative variable is MaxHeartRate)
##D plot(res_with)
##D 
##D # Boxplot for the continuous variable MaxHeartRate
##D plot(res_with, y="MaxHeartRate")
##D 
##D # Empirical and theoretical distributions (to check that the distribution is well-fitted)
##D plot(res_with, y="MaxHeartRate", type="cdf")
##D 
##D # Summary of categorical variable
##D plot(res_with, y="Sex")
## End(Not run)



