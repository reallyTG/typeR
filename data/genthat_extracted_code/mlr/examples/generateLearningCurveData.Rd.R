library(mlr)


### Name: generateLearningCurveData
### Title: Generates a learning curve.
### Aliases: generateLearningCurveData LearningCurveData

### ** Examples

r = generateLearningCurveData(list("classif.rpart", "classif.knn"),
task = sonar.task, percs = seq(0.2, 1, by = 0.2),
measures = list(tp, fp, tn, fn), resampling = makeResampleDesc(method = "Subsample", iters = 5),
show.info = FALSE)
plotLearningCurve(r)



