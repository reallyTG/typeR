library(classyfire)


### Name: ggEnsHist
### Title: Ensemble Histograms
### Aliases: ggEnsHist
### Keywords: hplot

### ** Examples

## Not run: 
##D data(iris)
##D 
##D irisClass <- iris[,5]
##D irisData  <- iris[,-5]
##D 
##D ens <- cfBuild(irisData, irisClass, bootNum = 100, ensNum = 100, parallel = TRUE, 
##D                cpus = 4, type = "SOCK")
##D 
##D # Basic histogram of the test accuracies in the ensemble
##D ggEnsHist(ens)
##D 
##D # Density plot of the test accuracies in the ensemble
##D ggEnsHist(ens, density = TRUE)
##D 
##D # Density plot that highlights additional descriptive statistics
##D ggEnsHist(ens, density = TRUE, percentiles=TRUE)
##D ggEnsHist(ens, density = TRUE, percentiles=TRUE, mean=TRUE)
##D ggEnsHist(ens, density = TRUE, percentiles=TRUE, median=TRUE)
## End(Not run)



