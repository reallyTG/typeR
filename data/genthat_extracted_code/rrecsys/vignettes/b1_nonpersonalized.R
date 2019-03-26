## ---- eval=FALSE---------------------------------------------------------
#  data("ml100k")
#  d <- defineData(ml100k)
#  e <- evalModel(d, folds = 2)
#  
#  globAv <- evalPred(e, alg = "globalaverage")
#  globAv
#  
#  # Algorithm names might be matched on the registry partially.
#  itemAv <- evalPred(e,  "itemAver")
#  itemAv
#  userAv <- evalPred(e,  "useraverage")
#  userAv

