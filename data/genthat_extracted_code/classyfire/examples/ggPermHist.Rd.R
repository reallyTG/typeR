library(classyfire)


### Name: ggPermHist
### Title: Permutation Histograms
### Aliases: ggPermHist
### Keywords: hplot

### ** Examples

## Not run: 
##D data(iris)
##D 
##D irisClass <- iris[,5]
##D irisData  <- iris[,-5]
##D 
##D permObj <- cfPermute(irisData, irisClass, bootNum = 10, ensNum = 20, permNum = 5, 
##D                      parallel = TRUE, cpus = 4, type = "SOCK")
##D 
##D # Basic histogram of the averaged test accuracies during permutation 
##D ggPermHist(permObj)
##D 
##D # Density plot 
##D ggPermHist(permObj, density=TRUE)
##D 
##D # Density plot that highlights additional descriptive statistics
##D ggPermHist(permObj, density=TRUE, percentiles = TRUE, mean = TRUE)
##D ggPermHist(permObj, density=TRUE, percentiles = TRUE, median = TRUE)
## End(Not run)



