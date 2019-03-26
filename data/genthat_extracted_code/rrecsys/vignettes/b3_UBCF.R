## ---- eval=FALSE---------------------------------------------------------
#  data("ml100k")
#  d <- defineData(ml100k)
#  e <- evalModel(d, folds = 2)
#  evalPred(e, "ubknn", simFunct = "Pearson", neigh = 10)

## ---- eval=FALSE---------------------------------------------------------
#  data("ml100k")
#  d <- defineData(ml100k)
#  e <- evalModel(d, folds = 2)
#  evalRec(e, "ubknn", simFunct = "Pearson", neigh = 10, positiveThreshold = 3, topN = 3)

