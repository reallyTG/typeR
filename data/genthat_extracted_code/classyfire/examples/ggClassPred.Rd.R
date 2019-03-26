library(classyfire)


### Name: ggClassPred
### Title: Barplot of the per class accuracies.
### Aliases: ggClassPred
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
##D # Show the percentages of correctly classified samples in 
##D # a barplot with or without text respectively
##D 
##D ggClassPred(ens)
##D ggClassPred(ens, showText = TRUE)
##D 
##D # Show the percentages of classified and missclassified samples
##D # in a barplot simultaneously with and without text
##D 
##D ggClassPred(ens, displayAll = TRUE)
##D ggClassPred(ens, position="stack", displayAll = TRUE)
##D ggClassPred(ens, position="stack", displayAll = TRUE, showText = TRUE)
##D 
##D # Alernatively, using a dodge position
##D ggClassPred(ens, position = "dodge", displayAll = TRUE)
##D ggClassPred(ens, position = "dodge", displayAll = TRUE, showText = TRUE)
## End(Not run)



