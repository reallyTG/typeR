library(classyfire)


### Name: ggEnsTrend
### Title: Trend of the test accuracies
### Aliases: ggEnsTrend
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
##D # Plot the trend of the test accuracies in the ensemble
##D ggEnsTrend(ens)
##D 
##D # Plot with text 
##D ggEnsTrend(ens, showText  = TRUE)
##D 
##D # Plot with text; set different limits on y axis 
##D ggEnsTrend(ens, showText  = TRUE, ylims=c(90, 100))
## End(Not run)



