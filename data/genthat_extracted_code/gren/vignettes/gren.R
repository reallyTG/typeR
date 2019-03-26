## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- eval=FALSE---------------------------------------------------------
#  install.packages("gren")

## ---- eval=FALSE---------------------------------------------------------
#  library(gren)

## ---- eval=FALSE---------------------------------------------------------
#  rm(list = ls())

## ---- eval=FALSE---------------------------------------------------------
#  ## load the data
#  data(dataColon)

## ---- eval=FALSE---------------------------------------------------------
#  dim(mirCol)

## ---- eval=FALSE---------------------------------------------------------
#  head(respCol)
#  table(respCol)

## ---- eval=FALSE---------------------------------------------------------
#  head(unpenCol)
#  
#  ## we check distribution of the clinical variables
#  apply(unpenCol[, c(1, 2, 4)], 2, table)
#  hist(unpenCol$age, main="Distribution of ages", xlab="Age")

## ---- eval=FALSE---------------------------------------------------------
#  head(mirExpr)
#  table(mirExpr)

## ---- eval=FALSE---------------------------------------------------------
#  mirColScaled <- scale(mirCol)

## ---- eval=FALSE---------------------------------------------------------
#  set.seed(1)
#  ## estimate the group-regularized elastic net model
#  fitGrenCol <- gren(x=mirColScaled, y=respCol, unpenalized=unpenCol,
#                     partitions=list(expression=mirExpr), alpha=0.5)

## ---- eval=FALSE---------------------------------------------------------
#  barplot(fitGrenCol$lambdag$expression, main="Estimated penalty multipliers",
#          ylab=expression(paste(lambda[g], "'")),
#          names.arg=c("Not expressed", "Medium differentially \n expressed",
#                      "Highly differentially \n expressed"))
#  abline(h=1, lty=2)

## ---- eval=FALSE---------------------------------------------------------
#  ## extract the estimates from te fitted object
#  estRegular <- coef(fitGrenCol$freq.model$regular, s=fitGrenCol$lambda)[, 1]
#  estGroupreg <- coef(fitGrenCol$freq.model$groupreg, s=fitGrenCol$lambda)[, 1]
#  
#  ## plot the estimates in a scatterplot
#  plot(estRegular, estGroupreg, col=mirExpr, xlab=expression(hat(beta)[regular]),
#       ylab=expression(hat(beta)[group]),
#       main="Regular vs group-regularized estimates")
#  legend("topleft", pch=1, col=c(1:3),
#         legend=c("Not expressed", "Medium differentially expressed",
#                  "Highly differentially expressed"))
#  
#  names(which(estRegular!=0))
#  names(which(estGroupreg!=0))
#  
#  intersect(names(estRegular)[which(estRegular!=0)[-c(1:6)]],
#            names(estGroupreg)[which(estGroupreg!=0)[-c(1:6)]])

## ---- eval=FALSE---------------------------------------------------------
#  set.seed(2)
#  fitGrenColSel <- gren(x=mirColScaled, y=respCol, unpenalized=unpenCol,
#                        partitions=list(expression=mirExpr), alpha=0.5, psel=50)
#  
#  ## extract the estimates from the model object
#  estRegularSel <- coef(fitGrenColSel$freq.model$regular,
#                        s=fitGrenColSel$lambda)[, 1]
#  estGroupregSel <- coef(fitGrenColSel$freq.model$groupreg,
#                         s=fitGrenColSel$lambda)[, 1]
#  ## plot the estimates in a scatterplot
#  plot(estRegularSel, estGroupregSel, col=mirExpr,
#       xlab=expression(hat(beta)[regular]), ylab=expression(hat(beta)[group]),
#       main="Regular vs group-regularized estimates, with model size 50")
#  legend("topleft", pch=1, col=c(1:3),
#         legend=c("Not expressed", "Medium differentially expressed",
#                  "Highly differentially expressed"))
#  
#  names(which(estRegularSel!=0))
#  names(which(estGroupregSel!=0))
#  
#  intersect(names(estRegularSel)[which(estRegularSel!=0)[-c(1:6)]],
#            names(estGroupregSel)[which(estGroupregSel!=0)[-c(1:6)]])

## ---- eval=FALSE---------------------------------------------------------
#  set.seed(3)
#  fitCvgrenCol <- cv.gren(x=mirColScaled, y=respCol, alpha=0.5,
#                          partitions=list(expression=mirExpr),
#                          unpenalized=unpenCol, psel=50, nfolds.out=10)

## ---- eval=FALSE---------------------------------------------------------
#  ## comparing ROCs for group-regularized and regular elastic net
#  par(pty="s")
#  plot(pROC::roc(respCol, as.numeric(fitCvgrenCol$groupreg$pred)), print.auc=TRUE,
#       print.auc.x=0.3, print.auc.y=0.2)
#  plot(pROC::roc(respCol, as.numeric(fitCvgrenCol$regular$pred)), add=TRUE, col=2,
#       print.auc=TRUE, print.auc.x=0.3, print.auc.y=0.1)
#  legend("topleft", legend=c("Group-regularized", "Regular"), col=c(1:2), lty=1)
#  par(pty="m")

## ---- eval=FALSE---------------------------------------------------------
#  plot(as.numeric(fitCvgrenCol$regular$pred),
#       as.numeric(fitCvgrenCol$groupreg$pred), col=respCol,
#       main="Predicted probabilities for Colon cancer data",
#       xlab="Predictions regular model",
#       ylab="Predictions group-regularized model")
#  legend("topleft", legend=c("progressive", "non-progressive/remission"),
#         col=c(1:2), pch=1)
#  
#  par(mfrow=c(1, 2))
#  hist(as.numeric(fitCvgrenCol$groupreg$pred), main="Group-regularized",
#       xlab="Predicted probabilities")
#  hist(as.numeric(fitCvgrenCol$regular$pred), main="Not group-regularized",
#       xlab="Predicted probabilities")
#  par(mfrow=c(1, 1))

## ---- eval=FALSE---------------------------------------------------------
#  ## load the data and inspect the different data object
#  data(dataCervical)

## ---- eval=FALSE---------------------------------------------------------
#  ## create 5 equally sized groups based on the standard deviations
#  std <- apply(mirCerv, 2, sd)
#  mirStd <- cut(std, breaks=quantile(std, seq(0, 1, 0.2)), include.lowest=TRUE)

## ---- eval=FALSE---------------------------------------------------------
#  ## create a partitions objected that contains the different co-data sets
#  partitions <- list(conservation=mirCons, std=mirStd)

## ---- eval=FALSE---------------------------------------------------------
#  ## create a partitions objected that contains the different co-data sets
#  monotone <- list(c(FALSE, TRUE), c(TRUE, TRUE))

## ---- eval=FALSE---------------------------------------------------------
#  ## prepare the data and estimate a model
#  mirCervScaled <- scale(mirCerv)
#  
#  set.seed(4)
#  fitGrenCervSel <- gren(x=mirCervScaled, y=respCerv, partitions=partitions,
#                         alpha=0.5, monotone=monotone, psel=50)

## ---- eval=FALSE---------------------------------------------------------
#  par(mfrow=c(1, 2))
#  barplot(fitGrenCervSel$lambdag$conservation,
#          main="Penalty multipliers conservation",
#          ylab=expression(paste(lambda[g], "'")),
#          names.arg=c("Not conserved", "Conserved in mammals",
#                      "Broadly conserved \n across vertebrates"))
#  barplot(fitGrenCervSel$lambdag$std,
#          main="Penalty multipliers standard deviation",
#          ylab=expression(paste(lambda[g], "'")),
#          names.arg=levels(mirStd))
#  par(mfrow=c(1, 1))

## ---- eval=FALSE---------------------------------------------------------
#  ## create a vector with the penalty multipliers per feature in it
#  multvec <- fitGrenCervSel$lambdag$conservation[
#    match(mirCons, names(fitGrenCervSel$lambdag$conservation))]*
#    fitGrenCervSel$lambdag$std[match(mirStd, names(fitGrenCervSel$lambdag$std))]
#  
#  ## and create a histogram of the multipliers
#  hist(multvec, main="Total penalty multiplier per feature", xlab="Penalty multiplier")

## ---- eval=FALSE---------------------------------------------------------
#  set.seed(5)
#  fitCvgrenCerv <- cv.gren(x=mirCervScaled, y=respCerv, alpha=0.5,
#                           partitions=partitions, monotone=monotone, psel=50,
#                           nfolds.out=10)

## ---- eval=FALSE---------------------------------------------------------
#  ## comparing ROCs for group-regularized and regular elastic net
#  par(pty="s")
#  plot(pROC::roc(respCerv, as.numeric(fitCvgrenCerv$groupreg$pred)),
#       print.auc=TRUE, print.auc.x=0.3, print.auc.y=0.2)
#  plot(pROC::roc(respCerv, as.numeric(fitCvgrenCerv$regular$pred)), add=TRUE,
#       col=2, print.auc=TRUE, print.auc.x=0.3, print.auc.y=0.1)
#  legend("topleft", legend=c("Group-regularized", "Regular"), col=c(1:2), lty=1)
#  par(pty="m")

## ---- eval=FALSE---------------------------------------------------------
#  plot(as.numeric(fitCvgrenCerv$regular$pred),
#       as.numeric(fitCvgrenCerv$groupreg$pred), col=respCerv,
#       main="Predicted probabilities for Cervical cancer data",
#       xlab="Predictions regular model",
#       ylab="Predictions group-regularized model")
#  legend("topleft", legend=c("CIN3", "normal"),
#         col=c(1:2), pch=1)
#  
#  par(mfrow=c(1, 2))
#  hist(as.numeric(fitCvgrenCerv$groupreg$pred), main="Group-regularized",
#       xlab="Predicted probabilities")
#  hist(as.numeric(fitCvgrenCerv$regular$pred), main="Not group-regularized",
#       xlab="Predicted probabilities")
#  par(mfrow=c(1, 1))

