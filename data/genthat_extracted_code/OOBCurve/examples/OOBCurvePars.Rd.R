library(OOBCurve)


### Name: OOBCurvePars
### Title: OOBCurvePars
### Aliases: OOBCurvePars

### ** Examples

## Not run: 
##D library(mlr)
##D task = sonar.task
##D 
##D lrn = makeLearner("classif.ranger", predict.type = "prob", num.trees = 1000)
##D results = OOBCurvePars(lrn, task, measures = list(auc))
##D plot(results$par.vals, results$performances$auc, type = "l", xlab = "mtry", ylab = "auc")
##D 
##D lrn = makeLearner("classif.ranger", predict.type = "prob", num.trees = 1000, replace = FALSE)
##D results = OOBCurvePars(lrn, task, pars = "sample.fraction", measures = list(mmce))
##D plot(results$par.vals, results$performances$mmce, type = "l", xlab = "sample.fract.", ylab = "mmce")
##D 
##D results = OOBCurvePars(lrn, task, pars = "min.node.size", measures = list(mmce))
##D plot(results$par.vals, results$performances$mmce, type = "l", xlab = "min.node.size", ylab = "mmce")
## End(Not run)



