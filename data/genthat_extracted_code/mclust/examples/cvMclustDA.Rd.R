library(mclust)


### Name: cvMclustDA
### Title: MclustDA cross-validation
### Aliases: cvMclustDA
### Keywords: multivariate

### ** Examples

## Not run: 
##D X <- iris[,-5]
##D Class <- iris[,5]
##D 
##D # common EEE covariance structure (which is essentially equivalent to linear discriminant analysis)
##D irisMclustDA <- MclustDA(X, Class, modelType = "EDDA", modelNames = "EEE")
##D cv <- cvMclustDA(irisMclustDA) # default 10-fold CV
##D cv[c("error", "se")]
##D 
##D cv <- cvMclustDA(irisMclustDA, nfold = length(Class)) # LOO-CV
##D cv[c("error", "se")] 
##D # compare with 
##D # cv1EMtrain(X, Class, "EEE")
##D 
##D # general covariance structure selected by BIC
##D irisMclustDA <- MclustDA(X, Class)
##D cv <- cvMclustDA(irisMclustDA) # default 10-fold CV
##D cv[c("error", "se")]
## End(Not run)



