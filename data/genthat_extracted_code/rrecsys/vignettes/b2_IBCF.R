## ---- eval=FALSE---------------------------------------------------------
#  data("ml100k")
#  d <- defineData(ml100k)
#  e <- evalModel(d, folds = 2)
#  ib_model_res <- evalPred(e, "ibknn", simFunct = "cos", neigh = 10)
#  ib_model_res

## ---- eval=FALSE---------------------------------------------------------
#  data("ml100k")
#  d <- defineData(ml100k)
#  e <- evalModel(d, folds = 2)
#  ib_model_res <- evalRec(e, "ibknn", simFunct = "cos", neigh = 10, positiveThreshold = 3, topN = 3)
#  ib_model_res

