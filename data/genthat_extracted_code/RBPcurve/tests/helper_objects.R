# make learner
lrn = makeLearner("classif.logreg")
lrn = setPredictType(lrn, "prob")
r = holdout(lrn, pid.task, show.info = FALSE)

# get predictions
pred = getPredictionProbabilities(r$pred)
y = r$pred$data$truth
positive = pid.task$task.desc$positive

# RBP object
obj = makeRBPObj(pred,  y)
tf = c(TRUE, FALSE)