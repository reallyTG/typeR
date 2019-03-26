## ---- eval = FALSE-------------------------------------------------------
#  
#    rs <- Rborist(x, y)
#  

## ---- eval = FALSE-------------------------------------------------------
#  
#    rs$validation$mae
#    rs$validation$mse
#    rs$validation$rsq
#  

## ---- eval = FALSE-------------------------------------------------------
#  
#     rs$validation$yPred

## ---- eval = FALSE-------------------------------------------------------
#  
#         rs$training$info
#  

## ---- eval = FALSE-------------------------------------------------------
#  
#         rs <- Rborist(x, y, noValidate = TRUE)

## ---- eval = FALSE-------------------------------------------------------
#         rs <- Rborist(x, y, quantiles = TRUE)

## ---- eval = FALSE-------------------------------------------------------
#         rs$validation$qPred

## ---- eval = FALSE-------------------------------------------------------
#         rs <- Rborist(x, y, quantVec = seq(0.1, 1.0, by=0.1))

## ---- eval = FALSE-------------------------------------------------------
#         rs <- Rborist(x, y, quantiles=TRUE, qBin=2000)

## ---- eval = FALSE-------------------------------------------------------
#         rs <- Rborist(x, y, thinLeaves=TRUE)

## ---- eval = FALSE-------------------------------------------------------
#         rs <- Rborist(x, y, nTree=100)

## ---- eval = FALSE-------------------------------------------------------
#         rs <- Rborist(x, y, minNode=20)

## ---- eval = FALSE-------------------------------------------------------
#         rs <- Rborist(x, y, nLevel = 1)

## ---- eval = FALSE-------------------------------------------------------
#         rs <- Rborist(x, y, minRatio = 0.1)

## ---- eval = FALSE-------------------------------------------------------
#         rs <- Rborist(x, y, autoCompress = 0.4)

## ---- eval=FALSE---------------------------------------------------------
#         rs <- Rborist(x, y)
#         ...
#         rs <- Streamline(rs)

## ---- eval = FALSE-------------------------------------------------------
#         rs <- Rborist(x, y, rowWeight = rep(1/nrow(y), nrow(y))

## ---- eval = FALSE-------------------------------------------------------
#         rs <- Rborist(x, y, predWeight = c(0.5, rep(1.0, ncol(x)-1)))

## ---- eval = FALSE-------------------------------------------------------
#         rs <- Rborist(x, y, regMono = rep(1.0, ncol(x)))

## ---- eval = FALSE-------------------------------------------------------
#         lv <- levels(y)
#         rs <- Rborist(x, y, classWeight = c(2.0, rep(1.0, length(lv) - 1))

## ---- eval = FALSE-------------------------------------------------------
#         rs <- Rborist(x, y, splitQuant = rep(0.5, ncol(x)))

## ---- eval = FALSE-------------------------------------------------------
#         rs <- Rborist(x, y, splitQuant = rep(0.0, ncol(x)))

## ---- eval = FALSE-------------------------------------------------------
#         pf <- Preformat(x)
#         rs <- Rborist(pf, y)

## ---- eval = FALSE-------------------------------------------------------
#         pf <- Preformat(B)
#         rm(B)
#         rs <- Rborist(pf, y)

