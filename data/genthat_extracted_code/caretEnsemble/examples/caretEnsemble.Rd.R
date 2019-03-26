library(caretEnsemble)


### Name: caretEnsemble
### Title: caretEnsemble: Make ensembles of caret models.
### Aliases: caretEnsemble caretEnsemble-package

### ** Examples

## Not run: 
##D set.seed(42)
##D models <- caretList(iris[1:50,1:2], iris[1:50,3], methodList=c("glm", "lm"))
##D ens <- caretEnsemble(models)
##D summary(ens)
## End(Not run)



