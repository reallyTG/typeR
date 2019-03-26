## ---- eval=FALSE---------------------------------------------------------
#  data("ml100k")
#  d <- defineData(ml100k)
#  e <- evalModel(d, folds = 2)
#  mf_model <- evalPred(e, "funk", k = 10, steps = 100, regCoef = 0.0001, learningRate = 0.001, biases = F)
#  mf_model

## ----eval=FALSE----------------------------------------------------------
#  data("ml100k")
#  d <- defineData(ml100k)
#  e <- evalModel(d, folds = 2)
#  mf <-  evalRec(e, "funk", k = 10, steps = 100, regCoef = 0.0001, learningRate = 0.001, biases = F, positiveThreshold = 3, topN = 3)
#  mf

