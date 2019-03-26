library(caretEnsemble)


### Name: summary.caretEnsemble
### Title: Summarize the results of caretEnsemble for the user.
### Aliases: summary.caretEnsemble

### ** Examples

## Not run: 
##D set.seed(42)
##D models <- caretList(iris[1:50,1:2], iris[1:50,3], methodList=c("glm", "lm"))
##D ens <- caretEnsemble(models)
##D summary(ens)
## End(Not run)



