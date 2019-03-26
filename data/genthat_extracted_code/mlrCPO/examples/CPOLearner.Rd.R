library(mlrCPO)


### Name: CPOLearner
### Title: CPO Learner Object
### Aliases: CPOLearner

### ** Examples

lrn = makeLearner("classif.logreg")
cpolrn = cpoScale() %>>% lrn
print(cpolrn)

getLearnerBare(cpolrn)  # classif.logreg Learner
getLearnerCPO(cpolrn)  # cpoScale() CPO

getParamSet(cpolrn)  # includes cpoScale hyperparameters

model = train(cpolrn, pid.task)  # behaves like a learner
retrafo(model)  # the CPORetrafo that was trained

predict(model, pid.task)  # otherwise behaves like an mlr model




