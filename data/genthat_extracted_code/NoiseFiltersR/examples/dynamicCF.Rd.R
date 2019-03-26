library(NoiseFiltersR)


### Name: dynamicCF
### Title: Dynamic Classification Filter
### Aliases: dynamicCF dynamicCF.default dynamicCF.formula

### ** Examples

# Next example is not run in order to save time
## Not run: 
##D data(iris)
##D trainData <- iris[c(1:20,51:70,101:120),]
##D # We fix a seed since there exists a random partition for the ensemble
##D set.seed(1)
##D out <- dynamicCF(Species~Petal.Length + Sepal.Length, data = trainData, nfolds = 5, m = 3)
##D summary(out, explicit = TRUE)
##D identical(out$cleanData, trainData[setdiff(1:nrow(trainData),out$remIdx),])
## End(Not run)



