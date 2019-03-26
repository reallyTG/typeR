library(RBPcurve)


### Name: plotRBPCurve
### Title: Plot residual-based predictiveness (RBP) curve.
### Aliases: plotRBPCurve

### ** Examples


# Download data
mydata = getTaskData(pid.task)
head(mydata)

# Build logit model and plot RBP curve
mylogit <- glm(diabetes ~ ., data = mydata, family = "binomial")
y = mydata$diabetes
pred1 = predict(mylogit, type="response")
obj1 = makeRBPObj(pred1, y)
plotRBPCurve(obj1, cond.axis = TRUE, type = "b")

## Not run: 
##D # Build logit model using mlr and plot RBP curve
##D task = pid.task
##D lrn = makeLearner("classif.logreg", predict.type = "prob")
##D tr = train(lrn, task)
##D pred2 = getPredictionProbabilities(predict(tr, task))
##D obj2 = makeRBPObj(pred2, y)
##D plotRBPCurve(obj2, cond.axis = TRUE, type = "b", col = 2)
## End(Not run)



