library(caretEnsemble)


### Name: plot.caretEnsemble
### Title: Plot Diagnostics for an caretEnsemble Object
### Aliases: plot.caretEnsemble

### ** Examples

## Not run: 
##D set.seed(42)
##D models <- caretList(iris[1:50,1:2], iris[1:50,3], methodList=c("glm", "rpart"))
##D ens <- caretEnsemble(models)
##D plot(ens)
## End(Not run)



