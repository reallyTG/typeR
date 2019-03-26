library(caretEnsemble)


### Name: autoplot
### Title: Convenience function for more in-depth diagnostic plots of
###   caretEnsemble objects
### Aliases: autoplot

### ** Examples

## Not run: 
##D set.seed(42)
##D models <- caretList(
##D  iris[1:50,1:2],
##D  iris[1:50,3],
##D  trControl=trainControl(method="cv"),
##D  methodList=c("glm", "rpart"))
##D ens <- caretEnsemble(models)
##D autoplot(ens)
## End(Not run)



