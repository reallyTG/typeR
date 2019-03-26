## ---- eval=FALSE---------------------------------------------------------
#  bpr <- rrecsys(smallML, "BPR", k = 10, randomInit = FALSE, regU = .0025, regI = .0025, regJ = 0.0025, updateJ = TRUE)
#  bpr

## ---- eval=FALSE---------------------------------------------------------
#  setStoppingCriteria(nrLoops = 10)

## ---- eval=FALSE---------------------------------------------------------
#  setStoppingCriteria(autoConverge = TRUE, deltaErrorThreshold = 1e-5, minNrLoops = 10)

